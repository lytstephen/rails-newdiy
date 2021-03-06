class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :shipping_add1, :string
    add_column :users, :shipping_add2, :string
    add_column :users, :shipping_city, :string
    add_column :users, :shipping_state, :string
    add_column :users, :shipping_zip, :string
    add_column :users, :shipping_country, :string
    add_column :users, :billing_add1, :string
    add_column :users, :billing_add2, :string
    add_column :users, :billing_city, :string
    add_column :users, :billing_state, :string
    add_column :users, :billing_zip, :string
    add_column :users, :billing_country, :string
    add_column :users, :active, :boolean, default: true
    add_column :users, :billing_same, :boolean, default: false
  end
end
