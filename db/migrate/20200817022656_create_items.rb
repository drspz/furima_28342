class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,                   null: false
      t.integer :selling_price,          null: false
      t.text    :explanation,            null: false
      t.integer :category_id,            null: false
      t.integer :condition_id,           null: false
      t.integer :postage_type_id,        null: false
      t.integer :shipping_region_id,     null: false
      t.integer :preparation_day_id,     null: false
      t.timestamps
    end
  end
end
