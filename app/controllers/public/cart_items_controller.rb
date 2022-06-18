class Public::CartItemsController < ApplicationController
    before_action :authenticate_customer!

    def index
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @total = 0
        @cart_items.each do |cart_item|
            @total += cart_item.subtotal
        end
    end

    def create
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.customer_id = current_customer.id
        @exist_cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        if @exist_cart_item.present?
            @amount=@cart_item.amount + @exist_cart_item.amount.to_i
            @exist_cart_item.update(amount: @amount)
            redirect_to cart_items_path
        else
            @cart_item.save
            redirect_to cart_items_path
        end
    end

    def update
        @cart_item = CartItem.find(params[:id])
        @cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end

    def destroy
        @cart_item = CartItem.find(params[:id])
        @cart_item.destroy
        redirect_to cart_items_path
    end

    def destroy_all
        current_customer.cart_items.destroy_all
        redirect_to cart_items_path
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
end