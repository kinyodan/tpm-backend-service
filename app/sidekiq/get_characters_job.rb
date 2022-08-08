class GetCharactersJob
  include Sidekiq::Worker

  def perform(*args)
    p "Started job to write books #{Time.now().strftime('%F - %H:%M:%S.%L')}"
    getCharacterBooks
    sleep 1
    p "Completed Write books job #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end

  private

  def getCharacterBooks
    characters = Character.all
    characters.each do |character|
      p character.books
    end
  end


end
