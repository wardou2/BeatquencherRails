class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update]

  def show
    render json: @project
  end

  def create
    @project = Project.new(project_params)
    def create
      @project = Project.find_or_create_by!(project_params)
      puts "@project:", @project
      if @project.valid?
        render json: { project: ProjectSerializer.new(@project) }, status: :created
      else
        render json: { error: 'failed to create project' }, status: :not_acceptable
      end
    end
  end

  def index
    @projects = Project.all
    render json: @projects
  end

  def update
    @project.update(project_params)
    if @project.save
     render json: @project, status: :accepted
    else
     render json: { errors: @project.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def project_params
   params.permit(:title)
  end

  def find_project
   @project = Project.find(params[:id])
  end
end
