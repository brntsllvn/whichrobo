Rails.application.routes.draw do

  root 'book_stores#index'
  resources :book_stores, only: [:index, :show]

end
