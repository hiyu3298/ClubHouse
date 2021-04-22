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
    root 'post_images#index'
    resources :post_images, only: [:new, :create, :index, :show, :destroy]
  end

  scope module: 'users' do

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
