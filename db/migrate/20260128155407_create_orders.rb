class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :email
      t.text :address
      t.decimal :total_price

      t.timestamps
    end
  end
end
