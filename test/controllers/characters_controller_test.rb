require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test 'should get index' do
    get characters_url, as: :json
    assert_response :success
  end

  test 'should create character' do
    assert_difference('Character.count') do
      post characters_url, params: { character: { book_id: @character.int, url: @character.string, updated_at: @character.timestamp, aliases: @character.string, allegiances: @character.string,books: @character.text,born: @character.string,created_at: @character.string, culture: @character.string,died: @character.string,father: @character.string,gender: @character.string,mother: @character.string,name: @character.string,playedby: @character.string,pov_books: @character.string,spouse: @character.string,titles: @character.string,tvSeries: @character.string } }, as: :json
    end

    assert_response :created
  end

  test 'should show character' do
    get character_url(@character), as: :json
    assert_response :success
  end

  test 'should update character' do
    patch character_url(@character), params: { character: { book_id: @character.int, url: @character.string, updated_at: @character.timestamp, aliases: @character.string, allegiances: @character.string,books: @character.text,born: @character.string,created_at: @character.string, culture: @character.string,died: @character.string,father: @character.string,gender: @character.string,mother: @character.string,name: @character.string,playedby: @character.string,pov_books: @character.string,spouse: @character.string,titles: @character.string,tvSeries: @character.string } }, as: :json
    assert_response :success
  end

  test 'should destroy character' do
    assert_difference('Character.count', -1) do
      delete character_url(@character), as: :json
    end

    assert_response :no_content
  end
end
