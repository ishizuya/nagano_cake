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
    @status = params[:order][:status]
    if @status == "payment_confirmation"
      @order.update(status: 1)
    elsif
      @status == "sent"
      @order.update(status: 4)
    end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end