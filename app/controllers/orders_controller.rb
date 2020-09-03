class OrdersController < ApplicationController
  before_action :move_to_order, except: [:index]
  before_action :authenticate_user!, expect: [:index]
  before_action :redirect_to_root, only: [:index]
  
  # before_action :redirect_to_new, only: [:new, :create]


  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:item_id])
    @Purchase = OrderPurchase.new   
  end
 

  
  def create
    @item = Item.find(params[:item_id])
    @Purchase = OrderPurchase.new(order_params)
   if @Purchase.valid?
     pay_item
     @Purchase.save
     return redirect_to root_path
   else
     render 'index'
   end 
  end

  private


  def move_to_order
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def redirect_to_root
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end


  # def redirect_new
  #   @item = Item.find(params[:item_id])
  #   if @item.purchase 
  #      redirect_to root_path
  #   end
  # end



  def order_params
    params.permit(:price, :token, :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :purchase_id, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    # binding.pry
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end


end
