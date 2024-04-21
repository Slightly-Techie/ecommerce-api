Rails.application.routes.draw do
  root to: 'application#home'
  post '/', to: 'graphql#execute'
end
