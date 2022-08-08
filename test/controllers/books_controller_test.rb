require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { integer,publisher: @book.integer,publisher, string,authors: @book.string,authors, string,country: @book.string,country, string,created_at: @book.string,created_at, string,isbn: @book.string,isbn, string,mediaType: @book.string,mediaType, string,name: @book.string,name, string,numberOfPages: @book.string,numberOfPages, string,releases: @book.string,releases, timestamp: @book.timestamp, timestamp,upadted_at: @book.timestamp,upadted_at, url: @book.url } }, as: :json
    end

    assert_response :created
  end

  test "should show book" do
    get book_url(@book), as: :json
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { integer,publisher: @book.integer,publisher, string,authors: @book.string,authors, string,country: @book.string,country, string,created_at: @book.string,created_at, string,isbn: @book.string,isbn, string,mediaType: @book.string,mediaType, string,name: @book.string,name, string,numberOfPages: @book.string,numberOfPages, string,releases: @book.string,releases, timestamp: @book.timestamp, timestamp,upadted_at: @book.timestamp,upadted_at, url: @book.url } }, as: :json
    assert_response :success
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book), as: :json
    end

    assert_response :no_content
  end
end
