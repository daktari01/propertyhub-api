class UsersAddMoreColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string, :after => 'email', :limit =>20, :null => false
    add_column :users, :first_name, :string, :after => 'username', :limit =>25, :null => true
    add_column :users, :last_name, :string, :after => 'first_name', :limit =>25, :null => true
    add_column :users, :phone, :string, :after => 'last_name', :limit =>15, :null => true
    add_column :users, :image_url, :string, :after => 'phone', :limit =>255, :null => false
  end
end
