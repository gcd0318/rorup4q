Rorup4q::Application.routes.draw do
  resources :bug_build_xrefs

  resources :bug_histories

  resources :fixing_codes
  get "fixing_code/get_subs" => "fixing_codes#get_subs"
  get "fixing_code/select_a_file" => "fixing_codes#select_a_file"
  get "fixing_code/re_select" => "fixing_codes#re_select"
  get "fixing_code/replace_file" => "fixing_codes#replace_file"
  get "fixing_code/to_commit" => "fixing_codes#to_commit"
  get "fixing_code/show_diffs" => "fixing_codes#show_diffs"
  get "fixing_code/show_diff_details" => "fixing_codes#show_diff_details"
  get "fixing_code/commit_files" => "fixing_codes#commit_files"

  resources :bugs
  get "bug/attach_to_bug" => "bugs#attach_to_bug"
  get "bug/get_attach" => "bugs#get_attach"
  get "bug/remove_attach" => "bugs#remove_attach"
  get "bug/filter" => "bugs#filter"
  get "bug/get_sub_items" => "bugs#get_sub_items"
  get "bug/remove_link" => "bugs#remove_link"
  get "bug/no_relate" => "bugs#no_relate"
  get 'bug/link_to_testcase' => 'bugs#link_to_testcase'
  get 'bug/change_feature' => 'bugs#change_feature'
  get 'bug/show_commits' => 'bugs#show_commits'
  get 'bug/hide_commits' => 'bugs#hide_commits'
  get 'bug/fix' => 'bugs#fix'
    
  resources :repositories
  get 'repository/show_detail' => 'repositories#show_detail'
  get 'repository/hide_detail' => 'repositories#hide_detail'
  get 'repository/show_commit' => 'repositories#show_commit'
  get 'repository/diff_commits' => 'repositories#diff_commits'

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
  get "testcase/add_link" => "testcases#add_link"
  get "testcase/remove_link" => "testcases#remove_link"
  get "testcase/update_status" => "testcases#update_status"
  get "testcase/save_status" => "testcases#save_status"
  get "testcase/no_relate" => "testcases#no_relate"
  get "testcase/filter" => "testcases#filter"
  get "testcase/link_to_bug" => 'testcases#link_to_bug'
  get 'testcase/bug_links' => 'testcases#bug_links'

  resources :attachments
#  get "attachment/attach_to_bug" => "attachment#attach_to_bug"

  resources :features

  resources :user_component_xrefs

  resources :components

  resources :user_track_xrefs

  resources :tracks
  get "track/delete_repository" => "tracks#delete_repository"

  resources :products
  get "product/add_member" => "products#add_member"
  get "product/filter" => "products#filter"

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
  #   get 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   get 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
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
  # get ':controller(/:action(/:id(.:format)))'
  get 'stats' => 'stats#index'
end
