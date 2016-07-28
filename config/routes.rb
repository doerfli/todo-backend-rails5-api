Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :todos
  match 'todos', to: 'todos#destroy_all', via: :delete
  root 'todos#index'

end
