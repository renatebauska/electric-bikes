require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users, skip: :registration, path_prefix: "auth"

  root "schedules#index"

  resources :users, except: :show

  resources :schedules do
    member do
      get "cancel"
    end
  end

  resources :bikes do
    resources :schedules
  end

  mount Sidekiq::Web => "/sidekiq"
end
