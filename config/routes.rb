Rails.application.routes.draw do
  # devise_for :admins
  # devise_for :customers
  root to: "public/homes#top"
  get "about" => "public/homes#about", as: "about"

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

  resources :items,only:[:index, :show]
  resources :customers,only:[:edit,:show]
  resources :cart_items,only:[:index]
  resources :oders,only:[:index,:show,:new]
  resources :addresses,only:[:index,:edit]

  namespace :admin do
    root to: "homes#top"
    resources :items,only:[:index, :show, :new, :create, :update, :edit]
    resources :genres,only:[:index,:edit,:create,:update]
    resources :customers,only:[:index,:show,:edit]
    resources :oders,only:[:show]
  end
end
