Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, path_names: { edit: 'password_edit' }, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  scope module: :users do
    get '/mypage', to: 'users#mypage', as: 'mypage'
    get '/bookmark', to: 'users#bookmark', as: 'bookmark'
    get '/edit', to: 'users#edit', as: 'edit_users'
    patch '/edit', to: 'users#updateInfo', as: 'updateinfo'
  end
  resources :lists, only: [:show, :create, :edit, :update] do
    resources :words, only: [:create, :update] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :add_words, only: [:create, :destroy]
end
