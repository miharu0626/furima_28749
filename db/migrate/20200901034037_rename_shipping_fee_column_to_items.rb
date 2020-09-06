class RenameShippingFeeColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_fee, :shipping_fee_id
  end
end
