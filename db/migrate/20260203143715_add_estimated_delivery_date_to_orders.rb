class AddEstimatedDeliveryDateToOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :estimated_delivery_date, :datetime
  end
end
