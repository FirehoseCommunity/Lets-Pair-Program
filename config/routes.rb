Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  get 'about' => 'static_pages#about'
  get 'contacts' => 'static_pages#contacts'
  get 'press' => 'static_pages#press'
  get 'terms' => 'static_pages#terms'

  resources :categories, only: [:new, :create, :index] do
    resources :sections, only: [:new, :create]
  end

  resources :sections, only: [:index] do
    resources :posts, only: [:new, :create, :index]
  end

  resources :users, only: :show

  resources :posts, only: [:index, :show] do
    member do
      post :reply
    end
  end
end
