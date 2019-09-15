# frozen_string_literal: true

module Api
  module V1
    class AdminsController < ApplicationController
      def index
        if admins = Admin.where(username: params[:username].to_s, password: params[:password].to_s)
          render json: { status: 'SUCCESS', message: 'Your token, if nothing displayed, your password or username might be incorrect', data: admins }, status: :ok
      end

        def create
          admin = Admin.create(username: params[:username], password: params[:password])
          render json: { status: 'SUCCESS', message: 'Your result', data: admin }, status: :ok
        end
  end
 end
end
end
