require 'httparty'

class BooksController < ApplicationController
  before_action :set_book, only: %i[ show update destroy ]
  before_action :rpc_get_books
  # include httparty
  #

  def rpc_get_books
    @base_uri = 'https://anapioficeandfire.com/api/'
    p @base_uri
    # p self.class.get("/books")
    response = HTTParty.get("#{@base_uri}/books")
    p response
  end

  # GET /books
  def index
    @books = Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:url, :string,name, :string,isbn, :string,authors, :string,numberOfPages, :integer,publisher, :string,country, :string,mediaType, :string,releases, :string,created_at, :timestamp,upadted_at, :timestamp)
    end
end
