Lema::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  root :to => "home#index"
  match '/trayectoria' => 'trayectoria#index'
  match '/obra-escrita' => 'obra#index', :as => :obra
  match '/obra-escrita/:id' => 'obra#show', :as => :obra_show
  match '/agenda' => 'agenda#index'
  match '/bitacora' => 'bitacora#index'
  match '/ticho-ediciones' => 'ticho#index', :as => :ticho
  match '/ticho-ediciones/:id' => 'ticho#show', :as => :ticho_show
  match '/capacitacion' => 'capacitacion#index'
  match '/capacitacion/locale/:locale' => 'capacitacion#locale', :as => :capacitacion_locale
  match '/capacitacion/category/:category_id' => 'capacitacion#category', :as => :capacitacion_category
  match '/capacitacion/course/:id' => 'capacitacion#show', :as => :capacitacion_show



  resources :posts do
    get 'page/:page', :action => :index, :on => :collection
  end

   # Feel free to change '/admin' to any namespace you need.
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
