Rails.application.routes.draw do
  constraints subdomain: "admin" do
    devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: "/")
    ActiveAdmin.routes(self)
  end

  root to: "api#healthcheck"
  post "/", to: "graphql#execute"
end
