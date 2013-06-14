OligoExome::Application.routes.draw do
  # Home page
  root :to => 'oligo_designs#welcome' 
  
  # Signup/Login 
  match '/signup' => 'users#new' 
  match '/forgot' => 'users#forgot'  

  match 'reset/:reset_code' => 'users#reset'
  match '/login'            => "sessions#new"
  match '/logout'           => 'sessions#destroy'
  
  resources :users
  resource  :session

  # Help/FAQ - v8 Exome
  match '/v8faq/technology'  => 'v8_help#technology'
  match '/v8faq/annotations' => 'v8_help#annotations'
  match '/v8faq/statistics'  => 'v8_help#statistics'
  match '/v8faq/figure_s1'   => 'v8_help#figure_s1'
  match '/v8faq/table_s5'    => 'v8_help#table_s5'
  match '/v8faq/table_s8'    => 'v8_help#table_s8'
  
  # Help/FAQ - v12 Exome
  
  # Help/FAQ - v13 Exome
  
  # Oligo Designs
  resources :oligo_designs
  match 'designquery' => 'oligo_designs#select_params'
  match 'list_oligos' => 'oligo_designs#list_selected'
  match 'export'      => 'oligo_designs#export'
  match 'export_design' => 'oligo_designs#export_design'
  
  # Zip download (entire exome of designs)
  match 'zip_download' => 'oligo_designs#zip_download'
  
  # Error/not implemented
  match 'notimplemented' => 'dummy#notimplemented'
 
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
  # match ':controller(/:action(/:id))(.:format)'
end
