class Api::V1::InstrumentPresetsController < ApplicationController
  before_action :find_instrument_preset, only: [:show, :update]

  def show
    render json: @instrument_preset
  end

  def index
    @instrument_presets = User.all
    render json: @instrument_presets
  end

  def update
    @instrument_preset.update(instrument_preset_params)
    if @instrument_preset.save
     render json: @instrument_preset, status: :accepted
    else
     render json: { errors: @instrument_preset.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def instrument_preset_params
    params.permit(:id, :type, :options)
  end

  def find_instrument_preset
    @instrument_preset = User.find(params[:id])
  end
end
