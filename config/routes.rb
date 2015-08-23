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

  resources :artists, controller: 'artists/artists', only: [:show, :index] do
    member do
      resource :profile, controller: 'artists/profiles', only: [:edit, :update], as: :artist_profile
    end
    member do
      resources :albums, controller: 'artists/albums', only: [:index, :new, :create], as: :artist_albums
    end
    collection do
      resources :albums, controller: 'artists/albums', only: [:show, :edit, :update, :destroy], as: :artist_albums do
        member do
          resources :tracks, controller: 'artists/tracks', only: [:new, :create], as: :artist_tracks
        end
        collection do
          resources :tracks, controller: 'artists/tracks', only: [:show, :edit, :update, :destroy], as: :artist_tracks
        end
      end
    end
    member do
      resources :videos, controller: 'artists/videos', only: [:index, :new, :create], as: :artist_videos
    end
    collection do
      resources :videos, controller: 'artists/videos', only: [:edit, :update, :destroy], as: :artist_videos
    end
    member do
      resources :shows, controller: 'artists/shows', only: [:index, :new, :create], as: :artist_shows
    end
    collection do
      resources :shows, controller: 'artists/shows', only: [:edit, :update, :destroy], as: :artist_shows
    end
    member do
      resources :merch, controller: 'artists/merches', only: [:index, :new, :create], as: :artist_merches
    end
    collection do
      resources :merch, controller: 'artists/merches', only: [:show, :edit, :update, :destroy], as: :artist_merches do
        member do
          resources :purchases, controller: 'artists/merch_purchases', only: :create, as: :artist_merch_purchases
        end
        collection do
          resources :purchases, controller: 'artists/merch_purchases', only: [:edit, :update, :destroy], as: :artist_merch_purchases
        end
      end
    end
    member do
      resources :microposts, controller: 'artists/microposts', only: :create, as: :artist_microposts
    end
    collection do
      resources :microposts, controller: 'artists/microposts', only: :destroy, as: :artist_microposts do
        member do
          resources :comments, controller: 'artists/comments', only: :create, as: :artist_micropost_comments
        end
        collection do
          resources :comments, controller: 'artists/comments', only: :destroy, as: :artist_micropost_comments
        end
      end
    end
    member do
      resources :relationships, only: :create
    end
    collection do
      resources :relationships, only: :destroy
    end
  end

  get 'artists/:id/select_albums' => 'artists/albums#select', as: :select_artist_album
  get 'artists/:id/select_videos' => 'artists/videos#select', as: :select_artist_video
  get 'artists/:id/select_shows' => 'artists/shows#select', as: :select_artist_show
  get 'artists/:id/select_merch' => 'artists/merches#select', as: :select_artist_merch
  get 'artists/:id/merch_transactions' => 'artists/merch_purchases#index', as: :artist_merch_transactions
  get 'artists/merch/purchases/:id/edit_shipped' => 'artists/merch_purchases#edit_shipped', as: :artist_merch_transactions_edit_shipped
  get 'artists/:id/followers' => 'artists/artists#followers', as: :artist_followers


  devise_scope :artist do
    get "sign_out", to: "artists/sessions#destroy"
  end

  ##### FAN ROUTES #####

  devise_for :fans, controllers: { sessions: "fans/sessions", passwords: "fans/passwords", registrations: "fans/registrations", confirmations: "fans/confirmations",  unlocks: "fans/unlocks"}

  resources :fans, controller: 'fans/fans', only: :show do
    member do
      resource :profile, controller: 'fans/profiles', only: [:edit, :update], as: :fan_profile
    end
  end

  get 'fans/:id/purchase_history' => 'fans/merch_purchases#index', as: :fan_purchase_history
  get 'fans/:id/following' => 'fans/fans#following', as: :fan_following

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
