class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    # @status = @order.status
    @making_status = params[:order_detail][:making_status]
    @order_details = OrderDetail.where(order_id: @order.id)
    # @order_details = @order.order_details
    if @making_status == "not_production"
      @order_detail.update(making_status: 0)
    elsif @making_status == "waiting_production"
      @order_detail.update(making_status: 1)
    elsif @making_status == "in_production"
      @order_detail.update(making_status: 2)
      @order.update(status: 2)
    elsif @making_status == "production_completion"
      @order_detail.update(making_status: 3)
      if @order_details.count == @order_details.where(making_status: "production_completion").count
        @order.update(status: 3)
      end
    end
    redirect_to  admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status,:order_id)
  end
end