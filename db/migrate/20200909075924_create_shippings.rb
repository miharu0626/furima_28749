class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.references :purchase,      null: false, foreign_key: true
      t.string     :post_code,     null: false
      t.integer    :prefecture_id, null: false
      t.string     :city,          null: false
      t.string     :add_num,       null: false
      t.string     :bld_name,      null: false
      t.string     :phone_num,     null: false

      t.timestamps
    end
  end
end
