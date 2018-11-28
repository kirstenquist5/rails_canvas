Rails.application.routes.draw do
  root 'courses#index'

  resources :users
  resources :courses do 
    resources :enrollments, only: [:index, :new, :create, :destroy]
  end
end
