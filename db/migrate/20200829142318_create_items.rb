class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,              null: false, foreign_key: true
      t.string     :name,              null: false
      t.string     :image,             null: false
      t.text       :detail,            null: false
      t.integer    :price,             null: false
      t.integer    :category,          null: false
      t.integer    :item_status,       null: false
      t.integer    :shipping_fee,      null: false
      t.integer    :shipping_location, null: false
      t.integer    :shipping_date,     null: false

      t.timestamps
    end
  end
end
