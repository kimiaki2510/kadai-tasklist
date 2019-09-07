Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  
  
  # URLが xxxx.com/ でアクセスされたときにtasksコントローラのindexメソッドに処理を渡す
  root to: 'tasks#index'

  
  get 'signup', to: 'users#new'
  #resources :users, only: [:index, :show, :new, :create]
  resources :users, only: [:new, :create]
  # resourcesはよくあるルーティングのセットをひとまとめに定義できるメソッド
  # tasksモデルに関する一連のルーティングを定義している
  resources :tasks
  
end
