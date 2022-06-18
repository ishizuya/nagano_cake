class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
        @customer = Customer.find(current_customer.id)
    end
#   def show
#     @customer = Customer.find_by(my_page: params[:my_page])
#   end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        if @customer.update(customer_params)
            flash[:success] = '更新しました'
            redirect_to  customer_path(@customer.id)
        else
            render 'edit'
        end
    end

    def withdraw
        @customer = Customer.find(current_customer.id)
        @customer.update(is_deleted: true)
        reset_session
        flash[:notice] = "退会処理を実行しました"
        redirect_to root_path
    end

    def unsubscribe
    end

    private
    def customer_params
        params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:postal_code,:address,:mail,:telephone_number,:is_deleted)
    end

end
