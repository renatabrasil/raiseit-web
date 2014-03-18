SystemGym::Application.routes.draw do
  
  scope '/student/:id' do
    get '', to: 'student#home', as: 'student_home'
    patch '', to: 'student#update'
    put '', to: 'student#update'
    get 'edit', to: 'student#edit', as: 'student_edit'
    get 'payments', to: 'student#payments', as: 'student_payments'
    get 'classes', to: 'student#classes', as: 'student_classes'
    get 'workout_sheet', to: 'student#workout_sheet', as: 'student_workout_sheet'
  end
  
  resources :model_workout_sheets do
    collection do
      match 'new_copy', to: 'model_workout_sheets#new_copy', via: [:get, :post]
    end
  end
  

  resources :physical_categories

  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, 
  :path => "usr"#, :skip => [:registrations]

  resources :employees
  resources :students
  # resources :instructors
  resources :entry_records
  
  resources :class_gyms do
    member do
      get 'student_attendance'
    end
  end

  resources :equipments
  resources :workouts
  resources :training_goals
  
  resources :workout_sheets do
    resources :trainings, except: [:index] do
      member do
        get 'specify_exercises'
      end
    end
  end
  
  resources :profile_trainings do
    member do
      get 'form_training'
      get 'form_exercise'
      get 'new_copy'
    end
  end
  
  resources :modalities
  
  # In routes.rb
  get '/employee/:type_employee' => 'employees#new', as: 'login'

  # resources :enrollments#, only: [:index, :new, :create]
  
  resources :enrollments do
    member do
      get 'confirm_registration'
      patch 'add_student'
    end
  end
  resources :payments#, only: [:index, :show]

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
