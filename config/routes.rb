Rails.application.routes.draw do
  namespace :api do
    resources :big_queries, only: :index do
      get :sync, on: :collection
    end

    resources :zendesks, only: :show
  end
end
