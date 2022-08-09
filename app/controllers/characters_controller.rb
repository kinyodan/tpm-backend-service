class CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]
  before_action :set_sort_parameters, only: %i[characters_concurrently]

  def characters_concurrently
    book_characters = []
    book = Book.where(isbn: params['isbn']).first
    sort = params[:sortBy]
    filter = params[:filters]
    
    if book && sort && sort[:name].size>0 && sort[:column_name].size>0 &&sort[:order].size>0
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
  def index
    @characters = Character.all

    render json: @characters
  end

  # GET /characters/1
  def show
    render json: @character
  end

  # PATCH/PUT /characters/1
  # DELETE /characters/1
  def destroy
    @character.destroy
  end

  private

  def calculate_age(book_characters)
    total_age = 0
    count = 0
    while count <= book_characters.count - 1
      if book_characters[count].died && book_characters[count].born
        age = book_characters[count].died.to_i - book_characters[count].born.to_i
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
    params.require(:character).permit(:book_id, :url, :name, :gender, :culture, :born, :died, :titles, :aliases, :father, :mother, :spouse, :allegiances, :books, :povBooks, :tvSeries, :played_by)
  end
end
