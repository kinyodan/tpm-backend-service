class AddAgeToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :age, :integer
  end
end
