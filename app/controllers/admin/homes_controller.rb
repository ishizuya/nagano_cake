class Admin::HomesController < ApplicationController
    before_action :authenticate_admin!
  
  def top
    @orders = Order.all.order('id DESC').page(params[:page]).per(10)
  end

end