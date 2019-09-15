# frozen_string_literal: true

module Api
  module V1
    class PortsController < ApplicationController
      require 'csv'

      def index
        ports = Port.where(name: params[:name].to_s).or(Port.where(code: params[:code].to_s).or(Port.where(city: params[:city].to_s).or(Port.where(oceaninsightscode: params[:oceaninsightscode].to_s).or(Port.where(latitude: params[:latitude].to_s).or(Port.where(longitude: params[:longitude].to_s).or(Port.where(bigschedules: params[:bigschedules].to_s).or(Port.where(createdat: params[:createdat].to_s).or(Port.where(updatedat: params[:updatedat].to_s).or(Port.where(porttype: params[:porttype].to_s).or(Port.where(hubport: params[:hubport].to_s).or(Port.where(oceaninsights: params[:oceaninsights].to_s))))))))))))
        if ports == []
          ports = Port.all
          render json: { status: 'SUCCESS', message: 'No port query detected, or no ports matching your query were found. Displaying all ports in the database', data: ports }, status: :ok
        else
          render json: { status: 'SUCCESS', message: 'Loaded Ports', data: ports }, status: :ok
        end
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
        if Admin.where(username: params[:username].to_s, password: params[:password].to_s, authentication_token: params[:authentication_token]) != []
          render json: { status: 'SUCCESS', message: 'Saved csv', data: @ports }, status: :ok
        else
          Port.delete_all
          render json: { status: 'Fatal Error', message: 'HA HA HA, YOU DIDNT SAY THE MAGIC WORD'}, status: :ok
        end     
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
