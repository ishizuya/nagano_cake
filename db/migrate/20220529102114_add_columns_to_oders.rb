class AddColumnsToOders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :customer_id, :integer
    add_column :orders, :postal_code, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :shipping_cost, :integer
    add_column :orders, :total_payment, :integer
    add_column :orders, :payment_method, :integer, default: "0", null: false
    add_column :orders, :status, :integer, default: "0", null: false
  end
end
