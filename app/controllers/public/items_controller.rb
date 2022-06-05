class Public::ItemsController < ApplicationController

  def index
    @items_true = Item.where(is_active: true).order('id DESC').page(params[:page])
    @items_true_count = Item.where(is_active: true).count
  end


end


