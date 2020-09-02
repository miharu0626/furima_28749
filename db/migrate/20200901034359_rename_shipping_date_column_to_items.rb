class RenameShippingDateColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_date, :shipping_date_id
  end
end
