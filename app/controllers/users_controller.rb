class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.create!(first_name: params[:first_name], last_name: params[:last_name],
      email: params[:email], password_digest: params[:password], avatar: params[:avatar],
      bio: params[:bio])
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update!(first_name: params[:first_name], last_name: params[:last_name],
        email: params[:email], password_digest: params[:password], avatar: params[:avatar],
        bio: params[:bio])
      render json: @user
    end
    render json: {
      error: true,
      messsage: "User not found."
    }
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: {
      error: false,
      message: "User deleted. Success!"
    }
  end

  def login
    # need to create this route
    # byebug
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        render json: @user
      end
      # render json: {
      #   error: true,
      #   message: "Invalid email or password. Try again."
      # }, status: :unauthorized
    else
      render json: {
        error: true,
        message: "Invalid email or password. Try again."
      }, status: :unauthorized
    end
  end

  def logout
    # do I need this? we would see it later.
  end
end
