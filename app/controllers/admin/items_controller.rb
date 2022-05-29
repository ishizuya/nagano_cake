class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    # @item_tax = (Item.price * 1.1).floor
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.image.attach(params[:id]) if @item.image.blank?
    if @item.update(item_params)
      flash[:success] = '更新しました'
      redirect_to admin_item_path(@item)
    else
      render 'edit'
    end
  end

  private
    def item_params
      params.require(:item).permit(:image,:name,:introduction,:price,:genre_id,:is_active)
    end
end
