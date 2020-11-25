Rails.application.routes.draw do

  resources :comments
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show]
    resources :articles

    resources :articles do
      resources :comments
    end
  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }
end