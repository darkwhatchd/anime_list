Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    root to: "home#index"
    resources :users
  end

  scope module: "animefront" do
    root to: "home#index"
  end
end
