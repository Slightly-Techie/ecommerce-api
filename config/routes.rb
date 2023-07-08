Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config.merge(path: "")
  ActiveAdmin.routes(self)

  root to: "api#healthcheck"
  post "/", to: "graphql#execute"
end

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  post "/graphql", to: "graphql#execute"
end

Rails.application.routes.draw do
  post '/confirm_email', to: 'users#confirm_email', as: 'confirm_email'
  post "/password/forgot", to: "users#forgot_password",as: "forgot_password"
end