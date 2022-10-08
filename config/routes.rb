Rails.application.routes.draw do
  get 'users/show'
  get '/', to: 'static_pages#home'
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
  }
  
  get 'rooms/index'
  resources :rooms do
    collection do
      get 'search'
    end
  end
  
  resources :reservations
  
end
