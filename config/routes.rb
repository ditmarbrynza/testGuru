Rails.application.routes.draw do
 
  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :users, only: :create
  resources :sessions, only: :create
  resources :contact_us

  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    resources :questions, only: :show, shallow: true, except: :index do 
      resources :answers, only: :show, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end 
  end

  resources :badges, only: %i[index], to: 'badges'

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
    resources :gists, only: %i[index]
    resources :badges
  end

end
