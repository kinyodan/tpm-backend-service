require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test 'should get index' do
    get books_url, as: :json
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post books_url, params: { book: { publisher: @book.integer, authors: @book.string, country: @book.string, created_at: @book.string, isbn: @book.string, mediaType: @book.string, name: @book.string, numberOfPages: @book.string, releases: @book.string, timestamp: @book.timestamp, updated_at: @book.timestamp, url: @book.url } }, as: :json
    end

    assert_response :created
  end

  test 'should show book' do
    get book_url(@book), as: :json
    assert_response :success
  end

  test 'should update book' do
    patch book_url(@book), params: { book: { publisher: @book.integer, authors: @book.string, country: @book.string, created_at: @book.string, isbn: @book.string, mediaType: @book.string, name: @book.string, numberOfPages: @book.string, releases: @book.string, updated_at: @book.timestamp, url: @book.url } }, as: :json
    assert_response :success
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@book), as: :json
    end

    assert_response :no_content
  end
end
