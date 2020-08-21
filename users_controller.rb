class UsersController < ApplicationController

  def index 
    @users = User.all 
    options = {
      include: [:post]
    }
    render json: UserSerializer.new(@users, options)
  end

  def show 
    @user = User.find(params[:id])
    options = {
      include: [:post]
    }
    render json: UserSerializer.new(@user, options)
    # // UserSerializer.new(@user).to_serialized_json
  end

end
