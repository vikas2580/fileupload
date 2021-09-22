Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  resources :files do 
    get 'tag'
    post :add_tags
    patch :share_file
    get 'download_file'
  end

  resources :tags, only: [:show]
end
