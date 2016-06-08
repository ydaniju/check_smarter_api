# frozen_string_literal: true
class HomeController < ApplicationController
  def index
    render json: { success: "Welcome home. Visit
      https://github.com/andela-ydaniju/check_smarter_api for documentation" }
  end
end
