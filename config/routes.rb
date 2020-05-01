Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :users do
    resource :profiles do
      resources :likes
    end
  end
  get 'about', to: 'pages#about'
  resources :contacts, only: :create
  get 'contact_us', to: 'contacts#new', as: 'new_contact'
  get 'changealb', to: 'profiles#changealb', as: 'change_album'
  post 'changealbcreate', to: 'profiles#changealbcreate'
  get 'editalbum', to: 'profiles#editalbum', as: 'edit_album'
  post 'albumcreate', to: 'profiles#albumcreate'
  get 'choosealb', to: 'profiles#choosealb', as: 'choose_album'
  post 'choosealbcreate', to: 'profiles#choosealbcreate'
  get 'searchalb', to: 'profiles#searchalb', as: 'search_album'
  post 'searchalbcreate', to: 'profiles#searchalbcreate'
end
