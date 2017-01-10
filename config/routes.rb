Rails.application.routes.draw do
  use_doorkeeper
  devise_for :users
  ActiveAdmin.routes(self)
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  namespace :api, defaults: {format: :json} do
   #post "blogs/create",  as: :blog_create_path
   get '/me', to: 'users#show'
   resources :blogs, only: [:index, :show, :create]
  end
   root 'pages#index'

end
