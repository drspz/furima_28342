class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:update, :destroy]
  before_action :redirect_show, only: [:show]

  #before_action :authenticate_user!, expect: :index


  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def update 
   if user_signed_in? && current_user.id == @item.user_id 
    @item.update(item_params)
    redirect_to root_path
   end  
  end

  def destroy
   if user_signed_in? && current_user.id == @item.user_id 
    @item.destroy
    redirect_to root_path
   end  
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_type_id, :shipping_region_id, :preparation_day_id, :selling_price ).merge(user_id: current_user.id)
  end


  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def redirect_show
    @item = Item.find(params[:id])
    if @item.purchase 
       redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
