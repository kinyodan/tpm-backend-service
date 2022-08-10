class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.integer :book_id
      t.string :url
      t.string :name
      t.string :gender
      t.string :culture
      t.string :born
      t.string :died
      t.text :titles
      t.text :aliases
      t.string :father
      t.string :mother
      t.string :spouse
      t.text :allegiances
      t.text :books
      t.text :povBooks
      t.string :tvSeries
      t.string :playedby
      t.timestamps
    end
  end
end
