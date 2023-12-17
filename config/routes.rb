Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "homes#top"
  
  get '/homes/about' => 'homes#about'
  
  
  get 'users/show'
  get 'users/:id/edit' =>'users#edit', as: 'edit_user'
  
  
  
  
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy,]
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
