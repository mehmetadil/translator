Rails.application.routes.draw do
  resources :profiles, only: %i[show edit update]
  get 'translated_articles/show'

  root 'articles#index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :articles
  get 'myarticles', to: 'articles#myarticles'
  get 'article_materials/:id', to: 'article_materials#materials', as: 'article_materials'
  get 'download_material/:id', to: 'article_materials#download_material',
                               as:  'download_material'
  resources :languages
  resources :offers, only: [:show]
  get 'myoffers', to: 'offers#myoffers'
  post 'create_offer', to: 'offers#create', as: 'create_offer'
  put 'accept_offer/:id', to: 'offers#accept_offer', as: 'accept_offer'

  get 'mytasks', to: 'tasks#mytasks'
  resources :tasks, only: [:show]
  post 'create_translate_order', to: 'translate_orders#create',
                                 as: 'create_translate_order'
  resources :translate_orders, only: %i[show index]
  get 'article_translate_orders/:id', to: 'translate_orders#article_translate_orders',
                                      as: 'article_translate_orders'
  get 'my_translate_orders', to: 'translate_orders#my_translate_orders',
                             as: 'my_translate_orders'
  resources :translated_articles, only: [:show]
  get 'translated_languages/:id', to: 'translated_articles#translated_languages', as: 'translated_languages'
  resources :version_trackers, only: [:show]
  post 'create_version_tracker', to: 'version_trackers#create',
                                 as: 'create_version_tracker'
  resources :version_tracker_materials, only: [:show]
  get "download_version_tracker_material/:id", to: 'version_tracker_materials#download_material',
                                               as: 'download_version_tracker_material'
  resources :version_tracker_comments, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
