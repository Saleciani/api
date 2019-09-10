module api
    module V1
        class PortsController < ApplicationController
            def index
                @ports = Port.all
                render json: {status 'Sucess'}
            end
    end
end
end