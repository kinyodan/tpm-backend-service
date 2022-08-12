class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :book_id
      t.string :title
      t.string :comment
      t.integer :character_id
      t.string :commenter_ip_address

      t.timestamps
    end
  end
end
