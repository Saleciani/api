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

      def import
        Port.import(params[:file])
      end
      
      def create
          #data = File.open("http://localhost:3000/api/v1/ports").read
          #parsed = CSV.parse(data).to_json   
          ports = Port.new(ports_params)
          ports.save
          render json: { status: 'SUCCESS', message: 'Saved csv', data: ports }, status: :ok
      end

      def destroy
        ports = Port.find(params[:id])
        ports.destroy
        render json: { status: 'SUCCESS', message: 'Deleted article', data: ports }, status: :ok
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
