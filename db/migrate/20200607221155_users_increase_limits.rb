class UsersIncreaseLimits < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :username, :string, :limit =>255
    change_column :users, :first_name, :string, :limit =>255
    change_column :users, :last_name, :string, :limit =>255
    change_column :users, :phone, :string, :limit =>255
  end
end
