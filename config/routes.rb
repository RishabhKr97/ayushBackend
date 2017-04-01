Rails.application.routes.draw do
  resources :institutions do
  	get '/history' , to: 'institutions#history'
    resources :locations
    resources :clinicals
  end
  resources :appointments

  resources :patients do
  	get '/appointments', to: 'patients#appointment'
  end

 get 'search/institutions', to: 'search#institutions'
 get 'search/doctors', to: 'search#doctors'
 get 'search/services', to: 'search#services'
 resources :timeslots
 resources :rates
 resources :patients
 resources :videos
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #For chat
   
  get 'chat', to: 'chat#index' 
  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
end
