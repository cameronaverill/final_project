Rails.application.routes.draw do
  
  resources :friendships


  devise_for :users, controllers: { registrations: "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  put 'parties/:party_id/dishes/:id/add' => 'dishes#add_dish_to_party', as: :purchase
  resources :diets, except: [:index] 
  resources :users
  resources :users do
    resources :dishes, only: [:index, :show]
    resources :parties, only: [:index, :show]
    get "show_search", to: "users#show_search"
  end
  resources :dishes, only: [:show, :create] do
    member do
      put "add_dish", to: "dishes#add_dish"
    end
  end
  resources :parties, only: [:show, :create, :new, :update, :edit] do
    post 'attend', to: "parties#attend"
    resources :dishes, only: [:new]
    put "create_party_dish", to: "dishes#create_party_dish" 
  end
  resources :intolerances, except: [:index]

  # Add dish to party
  get 'parties/:party_id/add_dish/:id' => 'dishes#add_dish_to_party', as: 'add_dish'

  # You can have the root of your site routed with "root"
  root 'users#current_user_home'



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
