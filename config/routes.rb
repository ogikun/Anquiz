Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, path_names: { edit: 'password_edit' }, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/search', to: 'searches#search', as: 'search'
  scope module: :users do
    get '/mypage', to: 'users#mypage', as: 'mypage'
    get '/bookmark', to: 'users#bookmark', as: 'bookmark'
    get '/edit', to: 'users#edit', as: 'edit_users'
    patch '/edit', to: 'users#updateInfo', as: 'updateinfo'
  end
  namespace :admins do
    get '/', to: 'admins#admin_page'
    get '/end_user_index', to: 'admins#end_user_index'
    get '/end_user/:id', to: 'admins#end_user'
    get '/list_index', to: 'admins#list_index'
    get '/list/:id', to: 'admins#list'
    get '/tag_index', to: 'admins#tag_index'
    get '/search', to: 'admins#search'
  end
  resources :lists, only: [:index, :show, :create, :edit, :update] do
    resources :words, only: [:create, :update] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :tags, only: [:create, :destroy] do
      resource :taggings, only: [:create, :destroy]
    end
    resources :comments, only: [:create, :destroy]
  end
end
