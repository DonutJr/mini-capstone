Rails.application.routes.draw do
  # get '/one_product_url' => 'products#one_product_action'
  # get '/all_products_url' => 'products#all_products_action'
  get '/' => 'products#index'
  get '/products' => 'products#index'

  get '/products/new' => 'products#new'
  post '/products' => 'products#create'


  get '/products/:id' => 'products#show'



  get '/products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'

  delete '/products/:id' => 'products#destroy'

end
