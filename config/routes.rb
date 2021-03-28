Rails.application.routes.draw do

  
  resources :reflections, except: %i[destroy]


  namespace :mosaic do
    resources :mosaic_settings, only: %i[edit update]
    get :statistics, to: "statistics#show"
    get :date_range_select, to: "daterangeselect#show"
  end
  devise_for :users
end
