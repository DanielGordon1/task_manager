Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks, only: [:create] do
    member do
      patch "mark"
    end
  end

  get "/about", to: "pages#about", as: :about
end
