class GroceryListDetail < ApplicationRecord
  belongs_to :grocerylist
  belongs_to :product
end
