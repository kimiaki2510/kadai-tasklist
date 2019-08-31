Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #URLが xxxx.com/ でアクセスされたときにusersコントローラのindexメソッドに処理を渡す
  root to: 'users#index'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  
  
  # URLが xxxx.com/ でアクセスされたときにtasksコントローラのindexメソッドに処理を渡す
  root to: 'tasks#index'
  
  # resourcesはよくあるルーティングのセットをひとまとめに定義できるメソッド
  # tasksモデルに関する一連のルーティングを定義している
  resources :tasks
end
