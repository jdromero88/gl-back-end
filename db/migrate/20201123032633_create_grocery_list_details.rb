class CreateGroceryListDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :grocery_list_details do |t|
      t.integer :quantity
      t.references :grocerylist, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
