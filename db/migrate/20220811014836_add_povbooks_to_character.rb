class AddPovbooksToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :povBooks, :text
  end
end
