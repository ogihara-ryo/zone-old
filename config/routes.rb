Rails.application.routes.draw do
  resources :tasks
  root 'top#index'

  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'
end
