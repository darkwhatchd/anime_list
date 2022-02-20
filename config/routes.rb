Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    root to: "home#index"
    resources :users
    resources :animes
  end

  scope module: "animefront" do
    root to: "home#index"
    get "/following", to: "follow_animes#index"
    get "/favorites", to: "favorite_animes#index"

    resources :animes, only: %i[index show] do
      resources :follow_animes, only: %i[create destroy]
      resources :favorite_animes, only: %i[create destroy]
    end
  end
end
