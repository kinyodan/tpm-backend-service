class AddReleasedToBook < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :released, :time
  end
end
