Rails.application.routes.draw do
  devise_for :admins,
              path: '/admin'
  devise_for :users,
              path: '/users',
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                registration: 'signup'
              },
              controllers: {
                sessions: 'sessions',
                registrations: 'registrations'
              }
  resources :users
  namespace :api do
    namespace :v1 do
      root to: 'home#index'
      resources :properties
    end
  end
end
