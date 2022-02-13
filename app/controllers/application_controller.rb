# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :require_login
end
