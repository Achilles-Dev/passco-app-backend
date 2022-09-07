Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope :api do
    resources :users, only: [:index, :show]
    resources :questions
    resources :answers
    resources :user_data, except: [:update]
  end
end
