# frozen_string_literal: true

module Api
  module V1
    class PortsController < ApplicationController
      require 'csv'
      def index
        ports = Port.all
        render json: { status: 'SUCCESS', message: 'Loaded Ports', data: ports }, status: :ok
      end

      def show
        #sql_query = "name ILIKE :query OR code ILIKE :query  OR city ILIKE :query  OR oceaninsightscode ILIKE :query  OR latitude ILIKE :query  OR longitude ILIKE :query  OR bigschedules ILIKE :query  OR createdat ILIKE :query  OR updatedat ILIKE :query  OR porttype ILIKE :query  OR hubport ILIKE :query  OR oceaninsights ILIKE :query"
        #ports = Port.where(sql_query, query: "%#{params[:q]}%")
        ports = Port.find(params[:id])
        #ports = Port.search_the_ports("%#{params[:q]}%")
        render json: { status: 'SUCCESS', message: 'Your result', data: ports }, status: :ok
      end

      def create
        file = ports_params[:port].tempfile.path
        CSV.foreach(file) do |row|
          id, name, code, city, ocean_insights_code, latitude, longitude, bigschedules, created_at, updated_at, port_type, hub_port, ocean_insights = row
          @ports = Port.create(name: name,
                               code: code,
                               city: city,
                               oceaninsightscode: ocean_insights_code,
                               latitude: latitude,
                               longitude: longitude,
                               bigschedules: bigschedules,
                               createdat: created_at,
                               updatedat: updated_at,
                               porttype: port_type,
                               hubport: hub_port,
                               oceaninsights: ocean_insights)
        end
        render json: { status: 'SUCCESS', message: 'Saved csv', data: @ports }, status: :ok
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
                      :oceaninsights,
                      :port)
      end
    end
  end
end
