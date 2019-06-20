class Api::V1::ScenesController < ApplicationController
  before_action :find_scene, only: [:show, :update, :destroy]
  before_action :is_authorized

  def show
    render json: @scene
  end

  def index
    @scenes = Scene.all
    render json: @scenes
  end

  def create
    @project = Project.find(scene_params['project_id'])
    @scene = Scene.new(name: scene_params['name'], project: @project)
    if @scene.save
      instruments = @project.instruments
      tracks = []
      instruments.each do |ins|
        tracks << Track.create(instrument_id: ins.id, scene_id: @scene.id)
      end

      render json: @scene, status: :created
    else
      render json: { error: 'failed to create instrument' }, status: :not_acceptable
    end
  end

  def update
    @scene.update(scene_params)
    if @scene.save
     render json: @scene, status: :accepted
    else
     render json: { errors: @scene.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @scene.destroy()
    render json: @scene
  end

  private

  def scene_params
    params.require(:scene).permit(:name, :project_id)
  end

  def find_scene
    @scene = Scene.find(params[:id])
  end
end
