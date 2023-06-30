Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: "")
  ActiveAdmin.routes(self)

  root to: "api#healthcheck"
  post "/", to: "graphql#execute"
end
