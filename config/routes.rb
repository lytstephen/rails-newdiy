Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => :registrations }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :users do
    get :dashboard, on: :collection
    get :uploaded, on: :member
    get :purchased_courses, on: :member
  end

  get 'categories/index'

  namespace :admin do
    get :index
    get :upload_course
    resources :categories
    resources :courses do
      get :manage, on: :collection
      get :remove_featured, on: :member
      get :remove_image1, on: :member
      get :remove_image2, on: :member
    end
    resources :users
    resources :orders, only: [:index, :show]
  end

  resources :categories

  resources :orders do
    get :cart, on: :collection
    get :checkout, on: :member
    get :checkout_signup, on: :member
    get :confirm, on: :member
    put :complete, on: :member
    get :purchase_history, on: :collection
    get :success, on: :collection
  end

  post 'create_video_line_item' => 'line_items#create_video_line_item'
  post 'create_materials_line_item' => 'line_items#create_materials_line_item'
  resources :line_items, only: [:index, :show, :update, :destroy] do
    get :add_material, on: :member
    get :subtract_material, on: :member
    get :sold, on: :collection
  end

  resources :courses do
    get :manage, on: :collection
    get :admin_upload, on: :collection
    get :remove_featured, on: :member
    get :remove_image1, on: :member
    get :remove_image2, on: :member
    get :filter_by_cat, on: :collection
  end

  root 'pages#index'

  get 'about' => 'pages#about'
  get 'faq' => 'pages#faq'
  get 'contact' => 'pages#contact'
  get 'readme' => 'pages#readme'

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
