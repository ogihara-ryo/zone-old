Rails.application.routes.draw do
  root 'top#index'

  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  resources :users, only: [] do
    resources :tasks, only: %i(index create update destroy)
    put '/tasks/:id/start' => 'tasks#start', as: 'task_start'
    put '/tasks/:id/finish' => 'tasks#finish', as: 'task_finish'
  end
end
