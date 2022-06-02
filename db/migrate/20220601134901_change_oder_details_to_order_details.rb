class ChangeOderDetailsToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    rename_table :oder_details, :order_details
  end
end
