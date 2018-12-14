module Api
  class ProjectsController < ApplicationController
    include SerializeData

    def index
      render json: { message: 'Loaded all projects',
                     data: serialize_data(Project.all) }, status: :ok
    end

    def create
      project = Project.new(permitted_params)
      if project.save
        render json: { message: 'Project is created.',
                       data: serialize_data(Project.all) }, status: :ok
      else
        render json: { message: 'Cannot create project' },
               status: 422
      end
    end

    def show
      project = Project.find_by(id: params[:id])
      if project
        render json: { message: 'Project found.',
                       data: serialize_data(project) }, status: :ok
      else
        render json: { message: 'Cannot find this project.' },
               status: 422
      end
    end

    def update
      project = Project.find(params[:id])
      if project.update(permitted_params)
        render json: { message: 'Project is updated.',
                       data: serialize_data(project) }, status: :ok
      else
        render json: { message: 'Cannot update this project.' },
               status: 422
      end
    end

    def destroy
      project = Project.find(params[:id])
      if project.destroy
        render json: { message: 'Project is deleted.' }, status: :ok
      else
        render json: { message: 'Cannot delete this project.' },
               status: 422
      end
    end

    private

    def permitted_params
      params.require(:project).permit(:name, :description)
    end
  end
end
