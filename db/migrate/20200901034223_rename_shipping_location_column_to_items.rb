class RenameShippingLocationColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_location, :shipping_location_id
  end
end
