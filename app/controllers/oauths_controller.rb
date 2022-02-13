# frozen_string_literal: true

class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider], allow_other_host: true)
  end

  def callback
    user = login_or_create(params[:provider])
    render json: user
  end

  private

  def login_or_create(provider)
    login_from(provider) || create_user_with_session_reset(provider)
  end

  def create_user_with_session_reset(provider)
    create_from(provider).tap do |user|
      reset_session
      auto_login(user)
    end
  end
end
