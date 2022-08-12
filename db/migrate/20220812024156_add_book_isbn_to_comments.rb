class AddBookIsbnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :book_isbn, :string
  end
end
