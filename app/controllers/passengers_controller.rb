class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :update, :destroy]

  # GET /passengers
  def index
    @passengers = Passenger.all

    render json: @passengers
  end

  # GET /passengers/1
  def show
    render json: @passenger
  end

  # POST /passengers
  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      render json: @passenger, status: :created, location: @passenger
    else
      render json: @passenger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /passengers/1
  def update
    if @passenger.update(passenger_params)
      render json: @passenger
    else
      render json: @passenger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /passengers/1
  def destroy
    @passenger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_passenger
      @passenger = Passenger.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def passenger_params
      params.require(:passenger).permit(:name)
    end
end
