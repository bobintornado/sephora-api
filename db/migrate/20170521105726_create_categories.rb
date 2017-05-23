class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
    end

    add_index :categories, :name, unique: true
  end
end
