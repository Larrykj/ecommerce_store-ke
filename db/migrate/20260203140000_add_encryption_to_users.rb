class AddEncryptionToUsers < ActiveRecord::Migration[8.1]
  def change
    # Add encrypted name column (name will be encrypted)
    add_column :users, :name_ciphertext, :text
    
    # Add blind index for email searching
    add_column :users, :email_bidx, :string
    add_index :users, :email_bidx
    
    # Migrate existing data if needed
    # Note: Run this after bundle install and generating keys
    # User.find_each do |user|
    #   user.save!
    # end
  end
end
