Rails.application.routes.draw do
  namespace :api do
    root 'big_queries#index'
  end
end
