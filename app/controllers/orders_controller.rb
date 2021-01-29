class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order
  before_action :contributor_confirmation, only: [:index]
  
  
  def index
    @useraddress = Useraddress.new
  end

  def create
    @useraddress = Useraddress.new(order_params)   
    if @useraddress.valid?
       pay_item
       @useraddress.save
       redirect_to root_path
    else
       render action: :index
    end
  end

     private
     def contributor_confirmation
       redirect_to root_path if current_user.id == @item.user.id
     end

     def set_order
      @item = Item.find(params[:item_id])
     end

    def order_params
      params.require(:useraddress).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
    end
  
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end
end

