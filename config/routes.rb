Rorup4t::Application.routes.draw do
  resources :fixing_codes
  match "fixing_code/get_subs" => "fixing_codes#get_subs"
  match "fixing_code/select_a_file" => "fixing_codes#select_a_file"
  match "fixing_code/re_select" => "fixing_codes#re_select"

  get "file_tree/get_sub_path"

  get "file_tree/get_sub_file"

  resources :bugs
  match "bug/attach_to_bug" => "bugs#attach_to_bug"
  match "bug/get_attach" => "bugs#get_attach"
  match "bug/remove_attach" => "bugs#remove_attach"
  match "bug/filter" => "bugs#filter"
  match "bug/get_sub_items" => "bugs#get_sub_items"
  match "bug/remove_link" => "bugs#remove_link"
  match "bug/no_relate" => "bugs#no_relate"
  match 'bug/link_to_testcase' => 'bugs#link_to_testcase'
  match 'bug/change_feature' => 'bugs#change_feature'
  match 'bug/show_commits' => 'bugs#show_commits'
  match 'bug/hide_commits' => 'bugs#hide_commits'
  match 'bug/fix' => 'bugs#fix'
    
  resources :repositories
  match 'repository/show_detail' => 'repositories#show_detail'
  match 'repository/hide_detail' => 'repositories#hide_detail'
  match 'repository/show_commit' => 'repositories#show_commit'
  match 'repository/diff_commits' => 'repositories#diff_commits'

  root :to => "admin#index"

  resources :user_testcase_xrefs

  resources :testcase_bug_xrefs

  resources :user_bug_xrefs
  
  resources :builds

  resources :user_feature_xrefs

  resources :user_product_xrefs

  get "admin/index"

#  get "sessions/new"

#  get "sessions/create"

#  get "sessions/destroy"

  resources :testcases
  match "testcase/add_link" => "testcases#add_link"
  match "testcase/remove_link" => "testcases#remove_link"
  match "testcase/save_status" => "testcases#save_status"
  match "testcase/no_relate" => "testcases#no_relate"
  match "testcase/filter" => "testcases#filter"
  match "testcase/link_to_bug" => 'testcases#link_to_bug'
  match 'testcase/bug_links' => 'testcases#bug_links'

  resources :attachments
#  match "attachment/attach_to_bug" => "attachment#attach_to_bug"

  resources :features

  resources :user_component_xrefs

  resources :components

  resources :user_track_xrefs

  resources :tracks

  resources :products
  match "product/add_member" => "products#add_member"
  match "product/filter" => "products#filter"

  resources :users

  get 'admin' => 'admin#index'
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
