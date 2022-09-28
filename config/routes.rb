Rails.application.routes.draw do
  scope :api do
    devise_for :users,
    controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
    }
  end
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, except: [:create]
      resources :questions
      resources :answers
      resources :user_data, except: [:update]
      resources :subjects
    end
  end
end
