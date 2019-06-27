Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks, only: [:create]
end
