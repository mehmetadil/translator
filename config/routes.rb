Rails.application.routes.draw do

  get 'translated_articles/show'

  root 'articles#index'
  devise_for :users
  resources :articles
  get "myarticles", to: 'articles#myarticles'
  resources :article_materials, only: [:show]
  get "download_material/:id", to: 'article_materials#download_material', :as => 'download_material'
  resources :languages
  resources :offers, only: [:show]
  get "myoffers", to: 'offers#myoffers'
  post "create_offer", to: 'offers#create', :as => 'create_offer'
  put "accept_offer/:id", to: 'offers#accept_offer', :as => 'accept_offer'

  get 'mytasks', to: 'tasks#mytasks'
  resources :tasks, only: [:show]
  post 'create_translate_order', to: 'translate_orders#create', :as => 'create_translate_order'
  resources :translate_orders, only: [:show]
  resources :translated_articles, only: [:show]
  post 'create_version_tracker', to: 'version_trackers#create', :as => 'create_version_tracker'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
