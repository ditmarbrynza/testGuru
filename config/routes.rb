Rails.application.routes.draw do
 
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :users, only: :create
  resources :sessions, only: :create

  delete :logout, to: 'sessions#destroy'

  resources :test, only: :index do
    resources :questions, shallow: true, except: :index do 
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end 
  end

  namespace :admin do
    resources :tests
  end

end
