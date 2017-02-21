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
    if current_user.admin
      @flight = Flight.new(flight_params)
      @flight.user = current_user
      if @flight.save
        redirect_to flights_path, notice: "Flight successfully added"
      else
        render "new"
      end
    else
      redirect_to flights_path, alert: "You have no permission to add a new flight"
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:number, :capacity, :date, :origin, :destination, :aircraft)
  end
end
