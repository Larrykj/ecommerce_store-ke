class AddEncryptionToOrders < ActiveRecord::Migration[8.1]
  def change
    # Add encrypted columns for sensitive order data
    add_column :orders, :name_ciphertext, :text
    add_column :orders, :email_ciphertext, :text
    add_column :orders, :address_ciphertext, :text
    add_column :orders, :phone_ciphertext, :text
    
    # Migrate existing data if needed
    # Note: Run this after bundle install and generating keys
    # Order.find_each do |order|
    #   order.save!
    # end
  end
end
