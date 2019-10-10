Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :users, only: :create
  resources :sessions, only: :create

  delete :logout, to: 'sessions#destroy'

  resources :tests do
    resources :questions, shallow: true, except: :index do 
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  #GET /test_passages/101/result
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end 
  end

  # resource :account
  # resource :account, controller: :account

  # resources :tests, only: %i[index show]

  # resources :tests do
  #   resources :questions, shallow: true
  # end

  # resources :tests do
  #   get :beginner, on: :collection

  #   member do
  #     post :start
  #   end
  # end

  # get '/tests', to: 'tests#index'
  # get '/tests(/:id)', to: 'tests#show', as: :test
  # get '/tests/:id/start', to: 'tests#start'
  # get  '/tests/new', to: 'tests#new'
  # get '/tests/:id/start', to: 'tasks#start'

  # match '/tests/:id', to: 'tests#create', via: %i[post put ]


end
