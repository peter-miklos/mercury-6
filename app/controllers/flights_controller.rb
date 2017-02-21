class FlightsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def new
    @flight = Flight.new
  end

  def create
  end

  private

  def flight_params
    params.require(:flight).permit(:number, :capacity, :date)
  end
end
