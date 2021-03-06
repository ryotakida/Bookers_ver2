Rails.application.routes.draw do


  get "/search" => 'searches#search'
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
 
 resources :users, only: [:show,:edit,:update,:index] do
  resources :messages, :only => [:create]
  resources :rooms, :only => [:create, :show, :index]   
    resource :relationships, only: [:create, :destroy]      
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
 end
 
end 
