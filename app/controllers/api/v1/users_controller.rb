class Api::V1::UsersController < ApplicationController
    
    #Add action to controller GET /users/1
    def show
        render json: User.find(params[:id])
    end
end