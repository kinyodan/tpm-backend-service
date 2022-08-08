class AddIsbnToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :book_isbn, :string
  end
end
