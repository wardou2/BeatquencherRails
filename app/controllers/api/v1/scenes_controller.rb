class Api::V1::ScenesController < ApplicationController
  before_action :find_scene, only: [:show, :update]

  def show
    render json: @scene
  end

  def index
    @scenes = Scene.all
    render json: @scenes
  end

  def update
    @scene.update(scene_params)
    if @scene.save
     render json: @scene, status: :accepted
    else
     render json: { errors: @scene.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def scene_params
    params.permit(:title)
  end

  def find_scene
    @scene = Scene.find(params[:id])
  end
end
