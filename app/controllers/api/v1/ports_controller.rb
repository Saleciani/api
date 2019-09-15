# frozen_string_literal: true

module Api
  module V1
    class PortsController < ApplicationController
      require 'csv'
      def index
        # sql_query = "name LIKE :query OR code LIKE :query  OR city LIKE :query  OR oceaninsightscode LIKE :query  OR latitude LIKE :query  OR longitude LIKE :query  OR bigschedules LIKE :query  OR createdat LIKE :query  OR updatedat LIKE :query  OR porttype LIKE :query  OR hubport LIKE :query  OR oceaninsights LIKE :query"
        #ports = Port.search_the_ports(params[:name, :code])
         ports = Port.where.any_of(name: "#{params[:name]}", code:"#{params[:code]}")
         #ports = Port.all
        render json: { status: 'SUCCESS', message: 'Loaded Ports', data: ports }, status: :ok
     end

      def show
        ports = Port.find(params[:id])
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
