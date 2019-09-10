module Api
    module V1
        class PortsController < ApplicationController
            def index
                @ports = Port.all
                render json: {status: 'Sucess', data:@ports}
            end
    end
end
end