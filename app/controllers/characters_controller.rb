class CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]
  before_action :set_sort_parameters, only: %i[characters_concurrently]

  def characters_concurrently
    book_characters = []
    book = Book.where(isbn: params['isbn']).first
    sort = params[:sortBy]
    filter = params[:filters]

    if book && sort && sort[:name].size>0 && sort[:column_name].size>0 && sort[:order].size>0
      book_characters = Character.where(book_id: book.id).order("#{sort[:column_name]} #{sort[:order]}")

    elsif book && sort && sort[:age].size>0 && sort[:column_name].size>0 && sort[:order].size>0
      book_characters = Character.where(book_id: book.id).order("#{sort[:column_name]} #{sort[:order]}")

    elsif book && sort && sort[:gender].size>0 && sort[:column_name].size>0 && sort[:order].size>0
      book_characters = Character.where(book_id: book.id).order("#{sort[:column_name]} #{sort[:order]}")

    elsif book && filter.count.positive?
      book_characters = Character.where(book_id: book.id)
    else
      book_characters = Character.where(book_id: book.id) if book
    end

    total_age = calculate_age(book_characters)
    p params[:sortBy]
    # p "sorting of data"
    # p sort[:name].size
    # p sort[:column_name].size
    # p sort[:order].size
    # p "sorting of data"
    meta = { total_characters: book_characters.count, total_age: total_age }
    @response = { status: true, message: 'Data retrieved ', metadata: meta, data: book_characters }
    render json: @response
  end

  # GET /characters
  def get_all_characters

    @characters_unique = Character.select('id,book_id,url,name,gender,culture,born,died, titles,aliases,father,mother, spouse, allegiances, books, pov_books, tv_series,played_by, created_at, updated_at').group(:url, :name)

    total_age = calculate_age_all(@characters_unique)
    age_years = total_age / 12
    age_months = total_age % 12
    age_total = "#{age_years}.#{age_months} years"
    meta = { total_characters: @characters_unique.length, total_age: age_total }
    @response = { status: true, message: 'Data retrieved ', metadata: meta, data: @characters_unique }
    render json: @response

  end

  # GET /characters/1
  def show
    render json: @character
  end

  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private

  def calculate_age(characters)
    total_age = 0
    count = 0
    while count <= characters.count - 1
      if characters[count].died && characters[count].born
        age = characters[count].died.to_i - characters[count].born.to_i
        total_age += age
      end
      count += 1
    end
    total_age
  end

  def calculate_age_all(characters)
    total_age = 0
    count = 0
    while count <= characters.length - 1
      if characters[count].died && characters[count].born
        age = characters[count].died.to_i - characters[count].born.to_i
        total_age += age
      end
      count += 1
    end

    total_age
  end

  def set_sort_parameters
    @sort_params = [
      { "name_ascending": { column_name: 'name', order: 'ASC' } },
      { "name_descending": { column_name: 'name', order: 'DESC' } },
      { "age_ascending": { column_name: 'age', order: 'ASC' } },
      { "age_descending": { column_name: 'age', order: 'DESC' } },
      { "gender_ascending": { column_name: 'gender', order: 'ASC' } },
      { "gender_descending": { column_name: 'gender', order: 'ASC' } }
    ]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:book_id, :url, :name, :gender, :culture, :born, :died, :titles, :aliases, :father, :mother, :spouse, :allegiances, :books, :pov_books, :tv_series, :played_by)
  end
end
