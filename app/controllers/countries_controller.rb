class CountriesController < ApplicationController

  def index
    @countries = {"country": "Spain"}
    json_response(@countries)
  end

  def show
    @country = Country.find(params[:id])
    json_response(@country)
  end

  def create
    @country = Country.create!(country_params)
    json_response(@country, :created)
  end

  def update
    @country = Country.find(params[:id])
    if @country.update!(country_params)
      render status: 200, json: { message: "Country has been updated successfully."}
    end
  end

  def destroy
    @country = Country.find(params[:id])
    if @country.destroy!
      render status: 200, json: { message: "Country has been deleted successfully."}
    end
  end

  private
  def country_params
    params.permit(:name)
  end

end
