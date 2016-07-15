Rails.application.routes.draw do


  root 'static_pages#home'
  get 'contact' => 'static_pages#contact'
  get 'stationery' => 'static_pages#stationery'
  get 'signup' => 'users#new'
  
  resources :users
  
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  get 'questionnaires' => 'questionnaires#index'
  get "questionnaires/new" => "questionnaires#new"
  post   "questionnaires" => "questionnaires#create"
  get "questionnaires/:id" => "questionnaires#delete"
  
  get 'news' => 'news#index'
  get "news/new" => "news#new"
  post 'news' => 'news#create'
  get "news/:id" => "news#delete"
  
  get 'products' => 'products#index'
  get 'lunch' => 'products#lunch'
  get 'bread' => 'products#bread'
  get 'noodle' => 'products#noodle'
  get 'drink' => 'products#drink'
  get "products/new" => "products#new"
  match 'products/create' => 'products#create',:via => :post

  get 'registers' => 'registers#register'
  match 'procucts/buy'  => 'registers#buy',:via => :post
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
