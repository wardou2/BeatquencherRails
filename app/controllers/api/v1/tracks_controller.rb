class Api::V1::TracksController < ApplicationController
  before_action :find_track, only: [:show, :update, :destroy]
  before_action :is_authorized, except: [:show, :index]

  def show
    render json: @track
  end

  def index
    @tracks = Track.all
    render json: @tracks
  end

  def new
    @track = Track.new(track_params)
    if @track.save
      render json: { instrument: UserSerializer.new(@instrument) }, status: :created
    else
      render json: { error: 'failed to create instrument' }, status: :not_acceptable
    end
  end

  # def multiple_track_new
  #   instrument_presets = InstrumentPreset.all
  #
  #   multiple_track_params['scene_count'].each do |x|
  #     scene = Scene.create(project_id: multiple_track_params['project_id'], name: `Scene #{x}`)
  #     instrument_presets.each do |insP|
  #       instrument = Instrument.create(ins_type: insP.type, name: insP.name, options: insP.options, effects: insP.effects)
  #     end
  #   end
  #
  # end

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

  def destroy
    @track.destroy()
    render json: @track
  end

  private

  def track_params
    params.require(:track).permit(:scene_id, :instrument_id, :notes => [])
  end

  def multiple_track_params
    params.permit(:project_id, :scene_count, :notes => [])
  end

  def find_track
    @track = Track.find(params[:id])
  end
end
