Rails.application.routes.draw do
  resources :permissions, only: %i[create show]
end
