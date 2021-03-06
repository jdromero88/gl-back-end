class UsersController < ApplicationController
  def index
    @users = User.all
    return render json: @users
  end

  def create
    # byebug
    @user = User.create!(first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password_digest: params[:password],
      avatar: params[:avatar],
      bio: params[:bio])
    return render json: @user
  end

  def show
    @user = User.find(params[:id])
    return render json: @user
  end

  def update
    @user = User.find(params[:id])
    if @user
      @user.update!(first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password_digest: params[:password],
        avatar: params[:avatar],
        bio: params[:bio])
      return render json: @user
    end
    return render json: {
      error: true,
      messsage: "User not found."
    }
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    return render json: {
      error: false,
      message: "User deleted. Success!"
    }
    return render json: {
      error: true,
      message: "User not found. Can't delete."
    }
  end

  def login
    # need to create this route
    # byebug
    @user = User.find_by(email: params[:email])
    if @user
      if @user.authenticate(params[:password])
        return render json: @user
      end
      return render json: {
        error: true,
        message: "Invalid email or password. Try again."
      }, status: :unauthorized
    else
      return render json: {
        error: true,
        message: "Invalid email or password. Try again."
      }, status: :unauthorized
    end
  end

  def logout
    # do I need this? we would see it later.
  end
end
