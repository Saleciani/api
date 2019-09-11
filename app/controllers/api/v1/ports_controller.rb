
module Api
  module V1
    class PortsController < ApplicationController

        def index
        @ports = Port.all
        render json: {status: 'Sucess' data:@ports}
        end

        def show
          @ports = Port.find(params[:id])
          render json: {status: 'Sucess' data:@ports}
        end
        
        def create
          @ports = Port.new(article_params) 
        end

        private

        def article_params
          params.permit(:title, :body)
        end
