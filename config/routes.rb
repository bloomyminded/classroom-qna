Rails.application.routes.draw do
  devise_for :users
  resources :questions do
    resources :comments, only: [:create, :index]
    member do
      post 'upvote' 
    end
  end

  root "questions#index"
end
