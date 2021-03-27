Rails.application.routes.draw do
  resources :mosaic_settings, only: %i[edit update]
  resources :reflections, only: %i[index new create edit update]

  devise_for :users
end
