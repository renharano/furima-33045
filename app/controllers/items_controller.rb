class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index 
    @items = Item.all.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:category_id,:status_id,:price,:prefecture_id,:day_id,:judgment_id,:image).merge(user_id: current_user.id)
  end
end