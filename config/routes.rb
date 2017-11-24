Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :permissions, only: :create do
        get :is_action_permitted, on: :collection
      end
    end
  end
end
