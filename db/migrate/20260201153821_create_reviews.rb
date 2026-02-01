class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :rating, null: false
      t.string :title
      t.text :content
      t.integer :helpful_count, default: 0

      t.timestamps
    end

    # Ensure a user can only leave one review per product
    add_index :reviews, [:user_id, :product_id], unique: true
    # Index for sorting by rating
    add_index :reviews, :rating
    add_index :reviews, :created_at
  end
end
