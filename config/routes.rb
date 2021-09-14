Rails.application.routes.draw do
  get 'books/edit'
  get 'books/index'
     devise_for :users
     root 'homes#index'     
     resource :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
