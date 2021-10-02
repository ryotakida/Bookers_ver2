Rails.application.routes.draw do


  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  root 'homes#top'   
  get "home/about" => "homes#about"
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :books_comments, only: [:create, :destroy]  
    resource :favorites, only: [:create, :destroy]
  end
     
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
 resources :users, only: [:show,:edit,:update,:index]
 
end 
