Rails.application.routes.draw do
  get 'top_seller/index'
  get 'profile/index'
  get 'sale_history/index'
  get 'purchase_history/index'
  resources :inventories
  resources :markets
  resources :items
  resources :users
  # get 'my_inventory', to: 'my_inventory#index' , as: 'inventory_pages'
  # get 'my_market', to: 'my_market#index' , as: 'market_pages'

  get 'login', to: 'login#index' , as: 'login'
  post 'login/control' , to: 'login#loginControl' , as: 'login_control'
  post 'logout' , to: 'login#logout' , as: 'logout'

  get 'my_market', to: 'my_market#index' , as: 'my_market'
  post 'my_market/buyItem' , to: 'my_market#buyItem' , as: 'my_market_buyItem'

  get 'my_inventory', to: 'my_inventory#index' , as: 'my_inventory'
  post 'my_inventory/add_item' , to: 'my_inventory#add_item' , as: 'my_inventory_add_item'

  get 'purchase_history', to: 'purchase_history#index' , as: 'purchase_history'

  get 'sale_history', to: 'sale_history#index' , as: 'sale_history'

  get 'profile', to: 'profile#index' , as: 'profile'
  post 'profile/changePassword' , to: 'profile#changePassword' , as: 'profile_changePassword'

  get 'top_seller', to: 'top_seller#index' , as: 'top_seller'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
