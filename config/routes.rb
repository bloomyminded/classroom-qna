Rails.application.routes.draw do
  resources :questions do
    resources :comments, only: [:create, :index]
    resources :votes, only: [:create, :index]
  end

  root "questions#index"
end
