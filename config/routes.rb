Rails.application.routes.draw do
  root 'top#index'

  post 'signin' => 'sessions#create'
  delete 'signout' => 'sessions#destroy'

  resources :users, only: [] do
    resources :tasks, only: %i(index create update destroy) do
      put 'start'
      put 'finish'
    end
  end
end
