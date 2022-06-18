class Admin::OrderDatailsController < ApplicationController
    before_action :authenticate_admin!
    
  def update
    order_datail = OrderDatail.find(params[:order_datail][:making_status])
    order_datail.update(making_status: order_datail.making_status)
    redirect_to  admin_order_path(oeder_datail.order.id)
  end

  private
  def order_datail_params
    params.require(:order_datail).permit(:making_status)
  end
end