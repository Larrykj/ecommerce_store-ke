class CreateProductViews < ActiveRecord::Migration[8.1]
  def change
    create_table :product_views do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
