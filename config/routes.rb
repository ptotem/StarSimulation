StarMediaSim::Application.routes.draw do
  resources :user_sim_data
  #resources :user_sim_data do
  #  #get :autocomplete_brand_name, :on => :collection
  #  get :autocomplete_simulation_datum_programme_name, :on => :collection
  #end

  resources :simulation_data

  resources :simulations

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount RailsAdminImport::Engine => '/rails_admin_import', :as => 'rails_admin_import'
  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'simulations#index'
  #match '/import_simulation_data' => "welcome#import_simulation_data", :as => :import_simulation_data
  match '/import_simulation_data', to: 'welcome#import_simulation_data', via: [:get, :post]

  #match '/importing_simulation_data' => "welcome#importing_simulation_data", :as => :importing_simulation_data
  match '/importing_simulation_data', to: 'welcome#importing_simulation_data', via: [:get, :post]

  match '/play_simulation/:simulation_id', to: 'user_sim_data#play_simulation', via: [:get, :post], :as=>"play_simulation"

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
