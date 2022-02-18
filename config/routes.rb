Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"

  namespace :admin do
    root to: "home#index"
  end

  scope module: "anime_front" do
    get "/", to: "home#index"
  end
end
