Rails.application.routes.draw do
  devise_for :admins
  devise_for :users, path_names: { edit: 'password_edit' }, controllers: { registrations: 'users/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  scope module: :users do
    get '/mypage', to: 'users#mypage', as: 'mypage'
    get '/edit', to: 'users#edit', as: 'edit_users'
    patch '/updateinfo', to: 'users#updateInfo', as: 'updateinfo'
  end
end
