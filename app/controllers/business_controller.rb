class BusinessController < ApplicationController
  def index
    @search_result = nil
    if params[:address].present?
      @search_result = Geocoder.coordinates(params[:address])
      @lat = @search_result[0]
      @lng = @search_result[1]
    else
      @lat = nil
      @lng = nil
    end
  end

  def show
    @lat = 37.7849074
    @lng = -122.4073169
    @venue_query = HTTParty.get('https://api.foursquare.com/v2/venues/search?ll=' + @lat.to_s + ',' + @lng.to_s + '&oauth_token=2YEFFRGQYVIGT2EJ30RHYLGELUCW04KHQM231ZSM3HOXQFBS&v=20130511')
    @venue_id = JSON.parse(@venue_query.response.body)["response"]["venues"][0]["id"]

    @photo_query = HTTParty.get("https://api.foursquare.com/v2/venues/" + @venue_id + "/photos?oauth_token=2YEFFRGQYVIGT2EJ30RHYLGELUCW04KHQM231ZSM3HOXQFBS&v=20130511")
    @num_photos = JSON.parse(@photo_query.response.body)["response"]["photos"]["count"]

    @bus_id = 1
    @revtilt_url = "http://revtilt.com/api/v1/organizations/" + @bus_id.to_s + ".json?page=1"
  end

  def about
  end
end
