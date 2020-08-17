class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  #before_action :authenticate_user!, expect: :index


  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
  end

  def update
    user = Tweet.find(params[:id])
    user.update(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:image, :text).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
