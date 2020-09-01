class CreateLinkedBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :linked_books do |t|
      t.references :post, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.text :content,                       null: false

      t.timestamps
    end

    add_index :linked_books, [:book_id, :post_id], unique: true
  end
end
