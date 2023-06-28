Rails.application.routes.draw do
  root to: 'application#healthcheck'
  post '/', to: 'graphql#execute'
end
