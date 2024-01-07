# frozen_string_literal: true
Rails.application.routes.draw do
  # <--- TESTING ROUTES --->
  get 'api/public' => 'public#public'
  get 'api/private' => 'private#private'
  get 'api/private-scoped' => 'private#private_scoped'
  # <--- END TESTING ROUTES --->
  # # <--- LIVE ROUTES --->
  resources :companies do
    resources :projects
  end

  resources :users, :company_users, :projects
  # <--- END LIVE ROUTES --->
end
