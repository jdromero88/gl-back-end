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
    return render json: @groceryListDetail
  end

  def show
    @groceryListDetail = GroceryListDetail.find(params[:id])
    if @groceryListDetail
      return render json: @groceryListDetail
    end
    return render json: {
      error: true,
      message: "Grocery List Details not found."
    }
  end

  def update
    @groceryListDetail = GroceryListDetail.find(params[:id])
    if @groceryListDetail
      @groceryListDetail.update!(
        quantity: params[:quantity],
        product_id: params[:product_id]
      )
      return render json: @groceryListDetail
    end
    return render json: {
      error: true,
      message: "Grocery List Details not found."
    }
  end

  
end
