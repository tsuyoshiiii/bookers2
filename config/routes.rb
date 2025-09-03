Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  get 'home/about' => "home#about", as: :about
  resources :users, only: [:index,:show,:edit,:update]
  resources :books do
    member do
      get :edit
    end
  end 
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
