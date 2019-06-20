class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :update, :destroy]
  before_action :is_authorized, except: [:index]

  def show
    render json: @project
  end

  def create
    @project = Project.new(title: project_params['title'], tempo: project_params['tempo'])

    if @project.save
      @user = User.find(project_params['user_id'])
      @project.user_projects.create(user_id: @user.id)

      render json: @project, status: :accepted
    else
      render json: { error: 'failed to create project' }, status: :not_acceptable
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

  def destroy
    @project.destroy()
    render json: @project
  end

  private

  def project_params
   params.require(:project).permit(:title, :tempo, :scenes, :instruments, :users, :user_id)
  end

  def find_project
   @project = Project.find(params[:id])
  end
end
