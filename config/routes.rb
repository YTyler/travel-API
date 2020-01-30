Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  post 'authenticate', to: 'authentication#authenticate'
  resources :countries do
    resources :cities do
      resources :reviews
    end
  end
end
