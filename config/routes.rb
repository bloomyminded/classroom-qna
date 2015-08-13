Rails.application.routes.draw do
  resources :questions, only: [:create, :new, :index, :show] do
    resources :comments, only: [:create, :new, :index]
  end
  root 'questions#index'
end
