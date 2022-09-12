Rails.application.routes.draw do
  devise_for :users,
  controllers: {
      sessions: 'api/v1/sessions',
      registrations: 'api/v1/registrations'
  }
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show]
      resources :questions
      resources :answers
      resources :user_data, except: [:update]
      resources :subjects
    end
  end
end
