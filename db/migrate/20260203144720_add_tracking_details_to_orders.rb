class AddTrackingDetailsToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :tracking_number, :string
    add_column :orders, :shipping_carrier, :string
  end
end
