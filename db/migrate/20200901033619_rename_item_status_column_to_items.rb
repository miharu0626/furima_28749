class RenameItemStatusColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :item_status, :item_status_id
  end
end
