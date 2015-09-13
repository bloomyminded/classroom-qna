Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth: 'users/omniauth',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks'
  }

  resources :courses, only: [:index, :show], shallow: true do
    resources :lectures, only: [:index, :show], shallow: true do
      resources :questions, only: [:index, :show, :create, :new], shallow: true do
        resources :comments, only: [:create, :destroy]
      end
    end
  end

  resources :schools, only: [:index, :show, :destroy]



  root "home#index"
end
