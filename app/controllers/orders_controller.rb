class OrdersController < ApplicationController

  def index
    @useraddress = Useraddress.new
  end
  
  def new
  end

  def create
    
    @useraddress = Useraddress.new(order_params)   #「UserDonation」に編集
    if @useraddress.valid?
       @useraddress.save
       redirect_to action: :index
    else
       render action: :index
    end
  end

     private
     # 全てのストロングパラメーターを1つに統合
    def order_params
      #@items = Items.find(params[:items_id])
      params.require(:useraddress).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end
   
end
