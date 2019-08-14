Rails.application.routes.draw do
  root 'home#index'

  patch 'question_sheets/position' => 'question_sheets#position'
  resources :question_sheets do
    resources :questions do
      
    end
  end

  resources :home do
    collection do
      get :forms
    end
  end

  resources :teams

  resources :team_users do
    collection do
      get :toggle
    end
    member do
      get :accept
      get :refuse
    end
  end


  devise_for :users
end
