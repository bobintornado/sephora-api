class AddCategoryRefToProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :products, :category, foreign_key: true, index: true
  end
end
