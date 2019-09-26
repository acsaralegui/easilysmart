Rails.application.routes.draw do
  devise_for :users
  root 'intro_pages#index'
  resources :coaches, only: [:index, :show] do
    resources :comments, only: :create
  end
  resources :tutorials, only:[:index, :show] do
    resources :enrollments, only: :create
  end
  resources :chapters, only: [:show]
  namespace :coach do
    resources :sections, only:[] do
      resources :chapters, only: [:new, :create]
    end
    resources :tutorials, only: [:new, :create, :show] do
      resources :sections, only: [:new, :create]
    end
      resources :coaches, only: [:new, :create, :show] do
    end
  end
  resources :users, only: :show
end
