class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:update, :show, :edit, :destroy]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  
  def index 
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
    render :new
    end
  end

  def show
  end

  def edit
    if @item.valid? 
      @item.order
    redirect_to root_path
    end
  end
  

  def update
    if @item.valid?
      @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.valid?
      @item.destroy
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:text,:category_id,:status_id,:price,:prefecture_id,:day_id,:judgment_id,:image).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end