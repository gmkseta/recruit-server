Rails.application.routes.draw do

  
  devise_for :users
  resources :form_sheets do
    resources :questions do
      member do
        post :answer
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root 'home#index'

  resources :home do
    collection do
      get :signin
      get :signup
    end
  end
end
