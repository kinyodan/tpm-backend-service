class AddTvseriesToCharacter < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :tv_series, :text
  end
end
