class Api::V1::InstrumentsController < ApplicationController
  before_action :find_instrument, only: [:show, :update]

  def show
    render json: @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    def create
      @instrument = Instrument.find_or_create_by!(instrument_params)
      puts "@instrument:", @instrument
      if @instrument.valid?
        render json: { instrument: UserSerializer.new(@instrument) }, status: :created
      else
        render json: { error: 'failed to create instrument' }, status: :not_acceptable
      end
    end
  end

  def index
    @instruments = Instrument.all
    render json: @instruments
  end

  def update
    @instrument.update(instrument_params)
    if @instrument.save
     render json: @instrument, status: :accepted
    else
     render json: { errors: @instrument.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def instrument_params
    params.permit(:ins_type, :options)
  end

  def find_instrument
    @instrument = Instrument.find(params[:id])
  end
end
