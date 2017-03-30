Rails.application.routes.draw do
  resources :institutions do
    resources :locations
    resources :clinicals
  end

  resources :patients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #For chat
   
  get 'chat', to: 'chat#index' 
  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end
end
