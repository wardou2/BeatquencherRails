class Api::V1::InstrumentsController < ApplicationController
  before_action :find_instrument, only: [:show, :update, :destroy]
  before_action :is_authorized, except: [:index]

  def show
    render json: @instrument
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      render json: { instrument: UserSerializer.new(@instrument) }, status: :created
    else
      render json: { error: 'failed to create instrument' }, status: :not_acceptable
    end
  end

  def index
    @instruments = Instrument.all
    render json: @instruments
  end

  def update
    puts instrument_params
    @instrument.update(instrument_params)
    if @instrument.save
     render json: @instrument, status: :accepted
    else
     render json: { errors: @instrument.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @instrument.destroy()
    render json: @instrument
  end

  private

  def instrument_params
    params.require(:instrument).permit(:ins_type, :name, :options => {}, :effects => [:eff_type, :eff_options => {}])
  end

  def find_instrument
    @instrument = Instrument.find(params[:id])
  end
end
