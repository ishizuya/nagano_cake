class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def index
    @orders = current_customer.orders.order(created_at: :desc)
  end

  # def confirm
  #   @order = Order.new(order_params)
  #   @address = Address.find(params[:order][:address_id])
  #   @order.postal_code = @address.postal_code
  #   @order.address = @address.address
  #   @order.name = @address.name
  # end

  def confirm
    if params[:order][:select_address] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
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

  def create
    @order = current_customer.orders.new(order_params)
    # @order = Order.find(order_params)
    @order.save
    # @order_details.order_id = Order.id
    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item.id
      @order_detail.order_id = @order.id
      @order_detail.price = cart_item.item.add_tax_price
      @order_detail.amount = cart_item.amount
      @order_detail.save
    end
    # binding.pry
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total = 0
    @order_details.each do |order_detail|
      @total += order_detail.subtotal
    end
    @total_payment = @total + @order.shipping_cost
  end
# pry-byebug

  private
    def order_params
      params.require(:order).permit(:customer_id, :shipping_cost, :total_payment, :payment_method, :postal_code, :address, :name)
    end
end
