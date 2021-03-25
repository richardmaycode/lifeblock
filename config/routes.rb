Rails.application.routes.draw do
  resources :reflections, only: %i[index new create edit update]

  devise_for :users
end
