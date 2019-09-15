# frozen_string_literal: true


module Api
    module V1
      class AdminsController < ApplicationController
      def index
        admins = Admin.all
        render json: { status: 'SUCCESS', message: 'Your result', data: admins }, status: :ok
      end

      def create
        admin = Admin.create(username: params[:username], password: params[:password])
        render json: { status: 'SUCCESS', message: 'Your result', data: admin }, status: :ok
      end
  end
 end
end
