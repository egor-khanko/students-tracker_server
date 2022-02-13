# frozen_string_literal: true

Rails.application.routes.draw do
  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback' # for use with Github, Facebook
  get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
end
