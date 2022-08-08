require "test_helper"

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:one)
  end

  test "should get index" do
    get characters_url, as: :json
    assert_response :success
  end

  test "should create character" do
    assert_difference("Character.count") do
      post characters_url, params: { character: { book_id: @character.book_id, int,url: @character.int,url, timestamp: @character.timestamp, timestamp,upadted_at: @character.timestamp,upadted_at, varchar,aliases: @character.varchar,aliases, varchar,allegiances: @character.varchar,allegiances, varchar,books: @character.varchar,books, varchar,born: @character.varchar,born, varchar,created_at: @character.varchar,created_at, varchar,culture: @character.varchar,culture, varchar,died: @character.varchar,died, varchar,father: @character.varchar,father, varchar,gender: @character.varchar,gender, varchar,mother: @character.varchar,mother, varchar,name: @character.varchar,name, varchar,playedby: @character.varchar,playedby, varchar,povBooks: @character.varchar,povBooks, varchar,spouse: @character.varchar,spouse, varchar,titles: @character.varchar,titles, varchar,tvSeries: @character.varchar,tvSeries } }, as: :json
    end

    assert_response :created
  end

  test "should show character" do
    get character_url(@character), as: :json
    assert_response :success
  end

  test "should update character" do
    patch character_url(@character), params: { character: { book_id: @character.book_id, int,url: @character.int,url, timestamp: @character.timestamp, timestamp,upadted_at: @character.timestamp,upadted_at, varchar,aliases: @character.varchar,aliases, varchar,allegiances: @character.varchar,allegiances, varchar,books: @character.varchar,books, varchar,born: @character.varchar,born, varchar,created_at: @character.varchar,created_at, varchar,culture: @character.varchar,culture, varchar,died: @character.varchar,died, varchar,father: @character.varchar,father, varchar,gender: @character.varchar,gender, varchar,mother: @character.varchar,mother, varchar,name: @character.varchar,name, varchar,playedby: @character.varchar,playedby, varchar,povBooks: @character.varchar,povBooks, varchar,spouse: @character.varchar,spouse, varchar,titles: @character.varchar,titles, varchar,tvSeries: @character.varchar,tvSeries } }, as: :json
    assert_response :success
  end

  test "should destroy character" do
    assert_difference("Character.count", -1) do
      delete character_url(@character), as: :json
    end

    assert_response :no_content
  end
end
