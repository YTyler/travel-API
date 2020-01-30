Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  resources :countries do
    resources :cities do
      resources :reviews
    end
  end
end
