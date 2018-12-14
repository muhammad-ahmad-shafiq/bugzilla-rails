module Api
  class DevelopersController < ApplicationController
    include SerializeData

    def index
      render json: { message: 'Loaded all developers',
                     data: serialize_data(Developer.all) }, status: :ok
    end

    def create
      developer = Developer.new(permitted_params)
      if developer.save
        render json: { message: 'Developer is created.',
                       data: serialize_data(Developer.all) }, status: :ok
      else
        render json: { message: 'Cannot create this developer.' },
               status: 422
      end
    end

    def show
      developer = Developer.find_by(id: params[:id])
      if developer
        render json: { message: 'Developer found.',
                       data: serialize_data(developer) }, status: :ok
      else
        render json: { message: 'Cannot find this developer.' },
               status: 422
      end
    end

    def update
      developer = Developer.find(params[:id])
      if developer.update(permitted_params)
        render json: { message: 'Developer updated.',
                       data: serialize_data(developer) }, status: :ok
      else
        render json: { message: 'Cannot update this developer.' },
               status: 422
      end
    end

    private

    def permitted_params
      params.require(:developer).permit(:name, :date_of_birth, :address,
                                        :designation)
    end
  end
end
