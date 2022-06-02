class AddColumnsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :item_id, :integer
    add_column :order_details, :order_id, :intger
    add_column :order_details, :price, :integer
    add_column :order_details, :amount, :integer
    add_column :order_details, :making_status, :integer, default: "0", null: false
  end
end
