# frozen_string_literal: true
CheckSmarterApi::Application.routes.draw do
  root to: "home#index"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      post "users/login" => "auth#login"
      resources :users, except: [:index] do
        resources :checklists
      end
    end
  end
end
