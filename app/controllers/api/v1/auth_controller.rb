# frozen_string_literal: true
module Api
  module V1
    class AuthController < BaseController
      before_action :authenticate_request, only: [:logout]

      def login
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
          render json: command.result
        else
          render json: command.errors, status: :unauthorized
        end
      end
    end
  end
end
