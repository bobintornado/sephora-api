class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false

      t.boolean :sold_out, null: false
      t.boolean :under_sale, null: false

      t.integer :price, index: true, null: false
      t.integer :sale_price,  index: true, null: false
    end
  end
end
