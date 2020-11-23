class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false 
      t.string :description
      t.blob :image

      t.timestamps
    end
  end
end
