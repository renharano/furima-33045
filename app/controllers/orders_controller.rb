class OrdersController < ApplicationController
  before_action :@item = Item.find(params[:item_id])
  def index
    @item = Item.find(params[:item_id])
    @useraddress = Useraddress.new
  end
  
  def new
  end

  def create
    @item = Item.find(params[:item_id])
    @useraddress = Useraddress.new(order_params)   
    if @useraddress.valid?
       pay_item
       
       @useraddress.save
       redirect_to action: :index
    else
       render action: :index
    end
  end

     private
     # 全てのストロングパラメーターを1つに統合
    def order_params
      @item = Item.find(params[:item_id])
      params.require(:useraddress).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id]).merge(token: params[:token])
    end
  
    def pay_item
      
      Payjp.api_key = "sk_test_3700c6459abc9f175bf24cae"  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
  end