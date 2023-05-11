Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'categories#index', as: :authenticated_user
  end

  unauthenticated do
    root 'homepage#home', as: :unauthenticated_user
  end

  resources :categories, only: [:index, :new, :create, :destroy, :show] do
    resources :purchases, only: [:index, :new, :create, :destroy]
  end
end
