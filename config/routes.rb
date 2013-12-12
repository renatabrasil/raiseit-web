SystemGym::Application.routes.draw do
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, 
  :path => "usr"#, :skip => [:registrations]

  resources :employees
  resources :students
  resources :instructors
  resources :entry_records
  
  # To uncomment when I have the intent to do the final version
  # get '/class_gyms/add_students' => 'class_gyms/add_students#direct_form', as: 'add_student'
  # get '/class_gyms/add_students/:class_gym_id' => 'class_gyms/add_students#select_class', as: 'add_student_second_step'
  
  # To test routes from add students
  # get '/class_gyms/add_students' => 'class_gyms/add_students#select_class', as: 'add_student'
  # post '/class_gyms/add_students' => 'class_gyms/add_students#insert_students', as: 'add_student2'
  # post '/class_gyms/add_students/confirm_class' => 'class_gyms/add_students#confirm_class'
  get '/class_gyms/add_students/select_class', as: 'add_student'
  
  # get '/class_gyms/add_students' => 'class_gyms/add_students#select_class', as: 'add_student'
  post '/class_gyms/add_students/select_students' => 'class_gyms/add_students#select_students'
  post '/class_gyms/add_students/students' => 'class_gyms/add_students#insert_student'
  get '/class_gyms/add_students/confirm_class/:class_gym_id' => 'class_gyms/add_students#confirm_class', as: 'confirm_class'
  
  # Steps from add students
  resources :class_gyms
  # resources :class_gyms do
    # resources :student, controller: 'class_gyms/add_students'
  # end
  
  # resources :class_gym_steps
  resources :modalities
  
  # In routes.rb
  get '/employee/:type_employee' => 'employees#new', as: 'login'
  

  resources :enrollments, only: [:index]
  resources :payments, only: [:index]

  #  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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