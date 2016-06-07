# frozen_string_literal: true
class HomeController < ApplicationController
  before_action :authenticate_request!

  def index
    render json: { success: "Welcome home" }
  end
end
