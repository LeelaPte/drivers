class DriversController < ApplicationController
  before_action :get_driver, only: [:show, :update, :destroy]

  def index
    render json: wrap(Driver.all), status: :ok
  end

  def create
    driver = Driver.new(driver_params)

    if driver.save
      render json: wrap(driver), status: :created
    else
      render json: { messages: driver.errors }, status: :bad_request
    end
  end

  def show
    if @driver.nil?
      return (render json: not_found_message, status: :not_found)
    end

    render json: wrap(@driver), status: :ok
  end

  def update
    if @driver.nil?
      return (render json: not_found_message, status: :not_found)
    end

    if @driver.update(driver_params)
      render json: wrap(@driver), status: :ok
    else
      render json: { messages: @driver.errors }, status: :bad_request
    end
  end

  def destroy
    if @driver.nil?
      return (render json: not_found_message, status: :not_found)
    end

    @driver.destroy
    render json: {}, status: :ok
  end

  protected

  def wrap(drivers)
    DriverSerializer.new(drivers).serialized_json
  end

  def not_found_message
    { error: "Record #{params[:id]} not found" }
  end

  private

  def driver_params
    params.require(:driver).permit(:name, :last_name, :code)
  end

  def get_driver
    @driver = Driver.find_by(id: params[:id])
  end
end
