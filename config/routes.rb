Rails.application.routes.draw do
  
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  
   resources :orders do 
     resources :orderitems 
   end
  
  devise_for :users do 
    resources :orders 
    end
    
  get '/checkout' => 'cart#createOrder'
  
  get 'cart/index'

  resources :products
  resources :categories
  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  
  get 'categories/new'
  get 'products/new'
  get 'products/index'
  get 'categories/index'
  
  get '/admin', to: 'user#admin_login'
  get '/logout', to: 'user#logout'
  
  get '/cart' => 'cart#index'
  get '/cart/clear' => 'cart#clearCart'
  get '/cart/:id' => 'cart#add'
  get '/cart/remove/:id' => 'cart#remove'
  
  get 'category/:name', to: 'static_pages#category'
  
  get 'orderitems/:id', to: 'orders#show'
  
  get '/orderConfirmed', to: 'static_pages#orderConfirmed'
  
  get '/paid' => 'static_pages#paid'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/search' => 'products#search'
end
