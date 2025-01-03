Rails.application.routes.draw do
  resources :todos
  get '/health_check', to: 'health_check#index'
end
