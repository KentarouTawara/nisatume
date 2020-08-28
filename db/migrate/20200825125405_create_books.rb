class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title,        null: false
      t.string :author,       null: false
      t.integer :isbn,        null: false
      t.string :publisher,    null: false
      t.string :book_image,   null: false

      t.timestamps
    end
  end
end
