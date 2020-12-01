class ProductsController < ApplicationController
  def index
    @products = Product.all
    return render json: @products
  end

  def create
    @product = Product.create!(name: params[:name], description: params[:description],
    image: params[:image])
    return render json: @product
  end

  def show
    @product = Product.find(params[:id])
    if @product
      return render json: @product
    end
    return render json: {
      error: true,
      message: "Product not found."
    }
  end

  def update
    @product = Product.find(params[:id])
    if @product
      return render json: @product
    end
    return render json: {
      error: true,
      message: "Product not found or doesn't exist."
    }
  end

  def destroy
    @product = Product.find(params[:id])
    if @product
      @product.destroy
      return render json: {
        error: false,
        message: "Product deleted. Success!"
      }
    end
    return render json: {
      error: true,
      message: "Product not found. Can't delete."
    }
  end

end
