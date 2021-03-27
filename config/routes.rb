Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, path_names: { edit: 'password_edit' }, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get '/search', to: 'searches#search', as: 'search'
  scope module: :users do
    get '/mypage', to: 'users#mypage', as: 'mypage'
    get '/bookmark', to: 'users#bookmark', as: 'bookmark'
    get '/mylist', to: 'users#mylist', as: 'mylist'
    get '/edit', to: 'users#edit', as: 'edit_users'
    patch '/edit', to: 'users#updateInfo', as: 'updateinfo'
    patch '/delete_user', to: 'users#delete_user', as: 'delete_user'
  end
  namespace :admins do
    get '/', to: 'admins#admin_page'
    get '/end_users', to: 'admins#end_user_index'
    get '/end_user/:id', to: 'admins#end_user', as: 'end_user'
    patch '/end_user/:id', to: 'admins#end_user_update'
    get '/lists', to: 'admins#list_index'
    get '/list/:id', to: 'admins#list', as: 'list'
    delete '/list/:id', to: 'admins#list_destroy'
    get '/tags', to: 'admins#tag_index'
    delete '/tag/:id', to: 'admins#tag_destroy', as: 'tag'
    get '/search', to: 'admins#search'
  end
  resources :lists, only: [:show, :create, :edit, :update ,:destroy] do
    resources :words, only: [:create, :destroy, :update] do
      resource :favorites, only: [:create, :destroy]
    end
    resources :tags, only: [:create] do
      resource :taggings, only: [:create, :destroy]
    end
    resources :comments, only: [:create, :destroy]
    resource :mylists, only: [:create, :destroy]
  end
end
