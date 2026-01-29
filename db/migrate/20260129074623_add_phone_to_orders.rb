class AddPhoneToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :phone, :string
  end
end
