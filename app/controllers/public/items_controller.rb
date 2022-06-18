class Public::ItemsController < ApplicationController
 before_action :authenticate_user!, except: [:index,:show]

  def index
    @items_true = Item.where(is_active: true).order('id DESC').page(params[:page])
    @items_true_count = Item.where(is_active: true).count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  # def show
  #   @item = Item.find(params[:id])
  #   @cart_item = CartItem.new
  #   @duplication = 0
  #   if current_end_user
  #     current_end_user.cart_items.each do |cart_item|
  #       if cart_item.item == @item
  #         @duplication += 1
  #       end
  #     end
  #   end

end


