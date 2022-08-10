class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :url
      t.string :name
      t.string :isbn
      t.text :authors
      t.string :numberOfPages
      t.string :publisher
      t.string :country
      t.string :mediaType
      t.datetime :released
      t.timestamps
    end
  end
end
