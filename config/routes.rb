Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :organizations, only: [ :index ] 
    end
  end
end
