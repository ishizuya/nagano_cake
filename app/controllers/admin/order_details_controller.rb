class Admin::OrderDetailsController < ApplicationController
    before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @making_status = params[:order_detail][:making_status]
    if @making_status == "in_production"
      @order_detail.update(making_status: 2)

      redirect_to  admin_order_path(@order)
    elsif @making_status == "production_completion"
      @order_detail.update(making_status: 3)
      redirect_to  admin_order_path(@order)
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status,:order_id)
  end
end