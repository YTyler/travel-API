class CitiesController < ApplicationController

  def index
    @country = Country.find(params[:country_id])
    @cities = @country.cities
    json_response(@cities)
  end

  def show
    @country = Country.find(params[:country_id])
    @city = City.find(params[:id])
    json_response(@city)
  end

  def create
    @country = Country.create!(country_params)
    @city = @country.city.new(city_params)
    json_response(@country, :created)
  end

  def update
    @city = City.find(params[:id])
    if @city.update!(city_params)
      render status: 200, json: { message: "City has been updated successfully."}
    end
  end

  def destroy
    @city = City.find(params[:id])
    if @city.destroy!
      render status: 200, json: { message: "City has been deleted successfully."}
    end
  end

  private
  def city_params
    params.permit(:name)
  end

end
