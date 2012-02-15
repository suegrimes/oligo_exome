ActionController::Routing::Routes.draw do |map|
  # Home page
  map.root :controller => "oligo_designs", :action => "welcome" 
  
  # Signup/Login 
  map.signup  '/signup',           :controller => 'users',   :action => 'new' 
  map.forgot  '/forgot',           :controller => 'users',   :action => 'forgot'  
  map.reset   'reset/:reset_code', :controller => 'users',   :action => 'reset'
  map.login  '/login',  :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.resources :users
  map.resource :session
  
  # Help/FAQ - v8 Exome
  map.faq_technology  '/v8faq/technology',  :controller => 'v8_help', :action => 'technology'
  map.faq_annotations '/v8faq/annotations', :controller => 'v8_help', :action => 'annotations'
  map.faq_statistics  '/v8faq/statistics',  :controller => 'v8_help', :action => 'statistics'
  map.figure_s1       '/v8faq/figure_s1',  :controller => 'v8_help', :action => 'figure_s1'
  map.table_s5        '/v8faq/table_s5',  :controller => 'v8_help', :action => 'table_s5'
  map.table_s8        '/v8faq/table_s8',  :controller => 'v8_help', :action => 'table_s8'
  
  # Help/FAQ - v12 Exome
  
  # Help/FAQ - v13 Exome
  
  # Oligo Designs
  map.resources :oligo_designs
  map.designquery 'designquery',       :controller => 'oligo_designs', :action => 'select_params'
  map.list_selected 'list_oligos',     :controller => 'oligo_designs', :action => 'list_selected'
  map.export 'export',                 :controller => 'oligo_designs', :action => 'export'
  
  # Zip download (entire exome of designs)
  map.zip_download 'zip_download',     :controller => 'oligo_designs', :action => 'zip_download'
  
  # Error/not implemented
  map.notimplemented 'notimplemented', :controller => 'dummy',         :action => 'notimplemented'
  
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #map.resources :recipes, :collection => { :search => :get }
  
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
