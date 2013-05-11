class BusinessController < ApplicationController
  def index
    @search_result = nil
    if params[:address].present?
      @search_result = Geocoder.coordinates(params[:address])
    end
  end

  def show
  end
end
