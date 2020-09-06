class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,                 null: false, foreign_key: true
      t.string     :name,                 null: false
      t.text       :detail,               null: false
      t.integer    :price,                null: false
      t.integer    :category_id,          null: false
      t.integer    :item_status_id,       null: false
      t.integer    :shipping_fee_id,      null: false
      t.integer    :shipping_location_id, null: false
      t.integer    :shipping_date_id,     null: false

      t.timestamps
    end
  end
end
