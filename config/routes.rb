Rails.application.routes.draw do
  resources :users do
    resources :followers, :only => [:index]
    resources :workouts do
      resources :exercises do
        get :autocomplete_exercise_name, on: :collection
        resources :rounds
      end
    end
  end

  resource :session, :only => [:new, :create, :destroy]
  resources :followers, :only => [:create, :destroy]

  get 'workouts/(:workout_id)', to: 'workouts#show', as: :show_workout
  get 'users/:id/exercises', to: 'exercises#index', as: :user_exercises

  get 'exercises/:id/chart', to: 'exercises#chart', as: :chart_exercise

  get 'signin' => 'sessions#new', as: 'signin'
  get 'signout' => 'sessions#destroy', as: 'signout'
  get 'signup' => 'users#new', as: 'signup'

  get 'search' => 'search#new', as: 'search'

  root 'application#index'
end
