Rails.application.routes.draw do
  resources :countries do
    resources :cities do
      resources :reviews
    end
  end
end
