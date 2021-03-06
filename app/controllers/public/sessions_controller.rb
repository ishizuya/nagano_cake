# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :customer_state, only: [:create]
  before_action :authenticate_customer!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  protected
    # 退会しているかを判断するメソッド
  def customer_state
    ## 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    ## アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    ## 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別 &$ 退会ステータスが有効かを判断
    unless @customer.valid_password?(params[:customer][:password]) && (@customer.is_deleted == false)
      ## 「取得したパスワードと入力したパスワードが一致しない」または「会員ステータスが退会」の場合は新規登録画面に遷移
      redirect_to new_customer_session_path
    end
  end

#     protected

#   # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
#   def reject_user
#     @user = User.find_by(name: params[:user][:name])
#     if @user
#       if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
#         flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
#         redirect_to new_user_registration
#       else
#         flash[:notice] = "項目を入力してください"
#       end
#     end
#   end
# end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  #   # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
