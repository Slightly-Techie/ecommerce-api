Rails.application.routes.draw do
  root to: "api#healthcheck"

  constraints subdomain: "admin" do
    devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: "/")
    ActiveAdmin.routes(self)
  end

  post "/", to: "graphql#execute"
end
