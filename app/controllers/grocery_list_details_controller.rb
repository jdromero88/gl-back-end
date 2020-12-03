class GroceryListDetailsController < ApplicationController
  def index
    @groceryListDetails = GroceryListDetail.all
    return render json: @groceryListDetails
  end

  def create
    @groceryListDetail = GroceryListDetail.create!(
      quantity: params[:quantity],
      grocery_lists_id: params[:grocery_lists_id],
      product_id: params[:product_id]
    )
  end

end
