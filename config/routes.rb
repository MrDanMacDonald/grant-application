GrantApp::Application.routes.draw do

  get "programs/index"
  get "programs/new"
  get "programs/create"
  get "programs/show"
  get "programs/edit"
  get "programs/update"
  get "programs/destroy"
  root to: 'static#index'
  
  get 'remove_attachment/' => 'grant_applications#delete_attachment'
  resources :grant_applications, only: [:index, :new, :create, :show, :destroy]
  
  get 'profile', to: 'users#profile', as: 'profile'
  put 'grant_applications/select_grant_program', to: 'grant_applications#select_grant_program', as: 'select_grant_program'
  put 'grant_applications/add_grant_details', to: 'grant_applications#add_grant_details', as: 'add_grant_details'
  put 'grant_applications/verify_eligibility', to: 'grant_applications#verify_eligibility', as: 'verify_eligibility'
  put 'grant_applications/add_supplemental_info', to: 'grant_applications#add_supplemental_info', as: 'add_supplemental_info'


  #Remove
  post 'users/new' => 'users#create'
  
  resources :organizations
  resources :users

  resource :subscriptions

  resources :sessions, only: [:new, :create, :destroy]

  namespace :admin do
    resources :grant_applications
    resources :users
    resources :organizations
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
