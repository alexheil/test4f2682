Rails.application.routes.draw do

  root 'static_pages#home'

  get 'privacy' => 'static_pages#privacy'
  get 'terms_of_use' => 'static_pages#terms_of_use'
  get 'contact' => 'static_pages#contact'
  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'copyright' => 'static_pages#copyright'
  get 'sign_up' => 'static_pages#sign_up'
  get 'sign_in' => 'static_pages#sign_in'

  ##### ARTIST ROUTES #####

  devise_for :artists, controllers: { sessions: "artists/sessions", passwords: "artists/passwords", registrations: "artists/registrations", confirmations: "artists/confirmations",  unlocks: "artists/unlocks"}

  get 'artists/:id' => 'artists/artists#show', as: :artist
  #resources :artists, controller: 'artists/artists', only: [:show]
  get 'artists/:id/edit_profile' => 'artists/profiles#edit', as: :edit_profile
  patch 'artists/:id/edit_profile' => 'artists/profiles#update'
  put 'artists/:id/edit_profile' => 'artists/profiles#update'

  devise_scope :artist do
    get "sign_out", to: "artists/sessions#destroy"
  end

  ##### FAN ROUTES #####

  devise_for :fans, controllers: { sessions: "fans/sessions", passwords: "fans/passwords", registrations: "fans/registrations", confirmations: "fans/confirmations",  unlocks: "fans/unlocks"}

   get 'fans/:id' => 'fans/fans#show', as: :fan
   #resources :fans, controller: 'fans/fans', only: [:show]

  devise_scope :fan do
    get "sign_out", to: "fans/sessions#destroy"
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => ''catalog#view'

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
