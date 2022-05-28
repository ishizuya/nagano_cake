class AddColumnsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :name, :string
    add_column :items, :introduction, :text
    add_column :items, :price, :integer
    add_column :items, :is_active, :boolean, default: "true", null: false
  end
end
