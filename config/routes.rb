Rails.application.routes.draw do
  
  devise_for :users
  devise_for :employees, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :pages
  resources :quote
  resources :leads
  # resources :interventions

  
  root 'leads#new'
  get 'interventions' => 'interventions#intervention'
  get 'geolocation/google'
  # get 'interventions/intervention'
  #get '/intervention', to: 'interventions#index'
  get 'index' => 'leads#new' # index
  get 'corporate' => 'pages#corporate' # corporate
  get 'residential' => 'pages#residential' # residential
  get 'quoteform' => 'quote#new' # quote form
  get 'login' => 'pages#login'
  get 'sign_up' => 'users#sign_up'
  get 'sign_in' => 'users#sign_in'
  get 'leads' => 'leads#new'
  get 'streamer' => 'pages#streamer'

  resources :interventions do
    get :get_building, on: :collection
    get :get_battery, on: :collection
    get :get_column, on: :collection
    get :get_elevator, on: :collection
  end

  # namespace :admin do
  #   resources :addresses do
  #     resources :customers do
  #       resources :buildings do
  #         resources :building_details
  #       end
  #     end
  #   end
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
