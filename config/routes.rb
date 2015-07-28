Rails.application.routes.draw do
  resources :users do
    resources :workouts do
      resources :exercises do
        resources :rounds
      end
    end
  end

  resource :session, :only => [:new, :create, :destroy]

  get 'workouts/(:workout_id)', to: 'workouts#show', as: :show_workout

  get 'signin' => 'sessions#new', as: 'signin'
  get 'signout' => 'sessions#destroy', as: 'signout'
  get 'signup' => 'users#new', as: 'signup'

  root 'application#index'
end
