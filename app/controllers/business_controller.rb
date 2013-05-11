class BusinessController < ApplicationController
  def index
    @search_result = nil
    if params[:address].present?
      @search_result = Geocoder.coordinates(params[:address])
      @lat = @search_result[0]
      @lng = @search_result[1]
    else
      @lat = 37.795
      @lng = -122.408
    end
  end

  def show
  end
end
