class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!
    
  def show
    @order = Order.find(params[:id])
    @orders = Order.all
    @order_details = @order.order_details
    @total = 0
    @order_details.each do |order_detail|
      @total += order_detail.subtotal
    end
    @total_payment = @total + @order.shipping_cost
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end