Rails.application.routes.draw do
  root 'home#index'

  patch 'question_sheets/position' => 'question_sheets#position'

  resources :question_sheets do
    resources :questions
    resources :answer_sheets
  end

  resources :answers

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
      get :change_role
      get :accept
      get :refuse
    end
  end

  devise_for :users
end
