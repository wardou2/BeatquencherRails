class Api::V1::TracksController < ApplicationController
  before_action :find_track, only: [:show, :update]

  def show
    render json: @track
  end

  def index
    @tracks = Track.all
    render json: @tracks
  end

  def getTracks
    tracks = Track.all.select{ |t| t.instrument_id === params["instrument_id"] && t.scene_id === params["scene_id"]}
    render json: tracks
  end

  def update
    @track.update(track_params)
    if @track.save
      render json: @track, status: :accepted
    else
      render json: { errors: @track.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def track_params
    params.permit(:notes)
  end

  def find_track
    @track = Track.find(params[:id])
  end
end
