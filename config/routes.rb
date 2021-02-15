Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :organizations, only: [ :index ] 
    end
  end
end
