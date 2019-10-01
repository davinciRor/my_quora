Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  root to: 'questions#index'

  resources :questions, shallow: true, except: [:edit] do
    resources :answers
  end
  resources :attachments, only: [:destroy]

  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup
end
