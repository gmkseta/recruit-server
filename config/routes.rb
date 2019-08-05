Rails.application.routes.draw do
  root 'home#index'

  resources :form_sheets
  resources :home do
    collection do
      get :signin
      get :signup
    end
  end
end
