class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create

    # @order =
  end


  # def confirm
  #   @order = Order.new(order_params)
  #   @address = Address.find(params[:order][:address_id])
  #   @order.postal_code = @address.postal_code
  #   @order.address = @address.address
  #   @order.name = @address.name
  # end

  def confirm
    if params[:payment_select] == 0
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:payment_select] == 1
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order = Order.new(order_params)
    end
    @cart_items = current_customer.cart_items
    @total = 0
    @cart_items.each do |cart_item|
      @total +=  cart_item.subtotal
    end
    @order.shipping_cost = 800
    @order.total_payment = @order.shipping_cost + @total
  end


  private
    def order_params
      params.require(:order).permit(:payment_method, :postal_code, :address, :name)
    end
end
