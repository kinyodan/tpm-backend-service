class AddPlayedbyToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :played_by, :string
  end
end
