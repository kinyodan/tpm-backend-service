require 'httparty'
require 'sidekiq-scheduler'

class GetBooksJob
  include Sidekiq::Worker

  def perform(*args)
    p "Started job to write books #{Time.now().strftime('%F - %H:%M:%S.%L')}"
    rpc_get_books
    sleep 1
    p "Completed Write books job #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end

  private

  def rpc_get_books
    response = HTTParty.get("#{ENV['BASE_URI']}/books")
    books_data = response.to_a
    p books_data.count
    p books_data[0]["released"].in_time_zone.utc
    books_data.each do |data|
      book_characters = data['characters']
      found = Book.where(isbn: data['isbn']).first
      if found
        p 'book record exists '
        characters_local = Character.where(book_id: found.id)
        if book_characters.count != characters_local.count
          rpc_save_book_characters(book_characters, found.id, data['isbn'])
        end
      else
        p 'Creating book record '
        items = [url: data['url'], name: data['name'], isbn: data['isbn'], authors: data['authors'], numberOfPages: data['numberOfPages'], publisher: data['publisher'], country: data['country'], mediaType: data['mediaType'], released: data['released'].in_time_zone.utc]
        saved_book = Book.upsert_all(items, update_only: nil, returning: nil, unique_by: nil, record_timestamps: nil)

        if saved_book
          rpc_save_book_characters(book_characters, saved_book.id, data['isbn'])
        end

      end
    end

  end

  def rpc_save_book_characters(characters, book_id, isbn)
    characters.to_a.each do |character_uri|

      p "Book character - #{character_uri}"
      response = HTTParty.get(character_uri)
      data = response
      items = [
        book_id: book_id,
        book_isbn: isbn,
        url: data['url'],
        name: data['name'],
        gender: data['gender'],
        culture: data['culture'],
        born: data['born'],
        died: data['died'],
        aliases: data['aliases'],
        father: data['father'],
        mother: data['mother'],
        spouse: data['spouse'],
        allegiances: data['allegiances'],
        books: data['books'],
        povBooks: data['povBooks'],
        tvSeries: data['tvSeries'],
        played_by: data['played_by'],
        age: { died: data['died'], born: data['born'] }
       ]

      found = Character.where(book_id: book_id, url: data['url']).first
      unless found
        p "Creating character - #{character_uri}--book #{book_id}"
        saved_character = Character.upsert_all(items, update_only: nil, returning: nil, unique_by: nil, record_timestamps: nil)
      end

    end

  end

end
