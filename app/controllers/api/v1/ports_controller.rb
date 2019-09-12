# frozen_string_literal: true

module Api
  module V1
    class PortsController < ApplicationController
      def index
        ports = Port.all
        render json: { status: 'SUCCESS', message: 'Loaded Ports', data: ports }, status: :ok
      end

      def show
        ports = Port.find(params[:id])
        render json: { status: 'SUCCESS', message: 'Loaded Portfound', data: ports }, status: :ok
      end

      def create
        ports = Port.new(ports_params)
          port.save
          render json: { status: 'SUCCESS', message: 'Saved article', data: article }, status: :ok

      end

      def destroy
        article = Article.find(params[:id])
        article.destroy
        render json: { status: 'SUCCESS', message: 'Deleted article', data: article }, status: :ok
      end



      private

      def ports_params
        params.permit(:name,
                      :code,
                      :city,
                      :oceaninsightscode,
                      :latitude,
                      :longitude,
                      :bigschedules,
                      :createdat,
                      :updatedat,
                      :porttype,
                      :hubport,
                      :oceaninsights)
      end
    end
  end
end
