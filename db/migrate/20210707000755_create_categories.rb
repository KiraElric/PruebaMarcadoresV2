class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.integer :parent_category, null: true

      t.timestamps
    end
  end
end
