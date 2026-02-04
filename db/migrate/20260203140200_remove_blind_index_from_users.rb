class RemoveBlindIndexFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_index :users, :email_bidx if index_exists?(:users, :email_bidx)
    remove_column :users, :email_bidx, :string if column_exists?(:users, :email_bidx)
  end
end
