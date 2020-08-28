class CreateLinkingBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :linking_books do |t|
      t.references :post, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.text :content,                       null: false

      t.timestamps
    end

    add_index :linking_books, [:book_id, :post_id], unique: true
  end
end
