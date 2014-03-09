GrantApp::Application.routes.draw do
root to: 'static#index'
  
  get 'remove_attachment/' => 'grant_applications#delete_attachment'
  resources :grant_applications do
     member do
      patch 'select_grant_program_update'
      get 'select_grant_program', as: 'program'
      patch 'add_grant_details_update'
      get 'add_grant_details', as: 'details'
    end
  end
  
  get 'profile', to: 'users#profile', as: 'profile'

  #Remove
  post 'users/new' => 'users#create'
  
  resources :organizations do
    member do
      patch 'verify_eligibility_update'
      get 'verify_eligibility', as: 'verification'
    end
  end
  resources :users

  resource :subscriptions

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :grant_applications
    resources :users
    resources :organizations
    resources :programs
  end
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
