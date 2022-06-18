Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :customers
  root to: "public/homes#top"
  get "about" => "public/homes#about", as: "about"
  # get "customers" => "public/customers#show", as: "my_page"
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  get "customers/unsubscribe" => "public/customers#unsubscribe", as: "unsubscribe"
  patch "customers/withdraw" => "public/customers#withdraw" , as: "withdraw"
  delete "cart_items/destroy_all" => "public/cart_items#destroy_all", as:"destroy_all"
  post "orders/confirm" => "public/orders#confirm", as: "confirm"
  get "oders/complete" => "public/orders#complete", as: "complete"

  scope module: :public do
    resources :items,only:[:index, :show]
    resources :customers,only:[:edit,:update,:show]
    # resources :customers, param: :my_page, path: '/', only: [:edit,:show,:update,:unsubscribe,:withdraw]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :orders,only:[:index,:show,:new,:create]
    resources :addresses,only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    get "/" => "homes#top"
    resources :items,only:[:index, :show, :new, :create, :update, :edit]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update]
    resources :order_datails,only:[:update]
  end
end
