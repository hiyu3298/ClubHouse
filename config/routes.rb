Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  namespace :admins do
    root 'admins#show'
    resources :post_images, only: [:new, :create, :index, :show, :destroy]
    resources :admins, only: [:show, :edit, :update]
    resources :reservations
  end

  scope module: 'users' do
    root 'home#top'
    get 'teams/search', to: 'teams#search'
    resources :users, only: [:show, :edit, :update]
    resources :teams, only: [:index, :show]
    resources :reservations
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
