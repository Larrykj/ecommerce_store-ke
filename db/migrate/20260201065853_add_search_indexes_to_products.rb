class AddSearchIndexesToProducts < ActiveRecord::Migration[8.1]
  def change
    # Add indexes to improve search and filtering performance
    add_index :products, :name, if_not_exists: true
    add_index :products, :price, if_not_exists: true
    add_index :products, :quantity, if_not_exists: true
    add_index :products, [:price, :quantity], name: 'index_products_on_price_and_quantity', if_not_exists: true
  end
end
