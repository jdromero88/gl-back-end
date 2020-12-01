class GroceryListsController < ApplicationController
  def index
    @groceryLists = GroceryList.all
    return render json: @groceryLists
  end

  def create
    @groceryList = GroceryList.create!(title: params[:title], active: params[:active],
      user_id: params[:user_id])
    return render json: @groceryList
  end

  def show
    @groceryList = GroceryList.find(params[:id])
    if @groceryList
      return render json: @groceryList
    end
    return render json: {
      error: true,
      message: "Grocery List not found."
    }
  end

  def update
    @groceryList = GroceryList.find(params[:id])
    if @groceryList
      @groceryList.update!(title: params[:title], active: params[:active])
      return render json: @groceryList
    end
    return render json: {
      error: true,
      message: "Grocery List not found."
    }
  end

  def destroy
    @groceryList = GroceryList.find(params[:id])
    if @groceryList
      @groceryList.destroy
      return render json: {
        error: false,
        message: "Grocery List deleted."
      }
    end
    return render json: {
      error: true,
      message: "Grocery List not found."
    }
  end


end
