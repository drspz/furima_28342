class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
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

  

  def destroy
    if item = Item.find(params[:id])
       item.destroy
       redirect_to root_path
    else
       render :edit
    end
  end

  def update
     if item = Item.find(params[:id])
        item.update(item_params)
        redirect_to root_path
     else
         render :edit
     end
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
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
end
