Rails.application.routes.draw do

  root 'articles#index'
  devise_for :users
  resources :articles
  get "myarticles", to: 'articles#myarticles'
  resources :article_materials, only: [:show]
  get "download_material/:id", to: 'article_materials#download_material', :as => 'download_material'
  resources :languages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
