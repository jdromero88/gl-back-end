class GroceryListDetail < ApplicationRecord
  belongs_to :grocery_lists
  belongs_to :product
end
