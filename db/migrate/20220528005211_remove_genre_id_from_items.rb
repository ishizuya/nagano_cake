class RemoveGenreIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :Genre_id, :integer
  end
end
