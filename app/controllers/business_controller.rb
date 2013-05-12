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

    revtilt_query = HTTParty.get('http://revtilt.com/api/v1/organizations/' + params[:oid] + '.json?page=1')
    @org = JSON.parse(revtilt_query.response.body)
    @reviews = @org['reviews']

    venue_query = HTTParty.get('https://api.foursquare.com/v2/venues/search?ll=' + @org['organization']['location']['latitude'].to_s + ',' + @org['organization']['location']['longitude'].to_s + '&oauth_token=2YEFFRGQYVIGT2EJ30RHYLGELUCW04KHQM231ZSM3HOXQFBS&v=20130511')
    venue_id = JSON.parse(venue_query.response.body)["response"]["venues"][0]["id"]
    @venue_data = JSON.parse(venue_query.response.body)

    photo_query = HTTParty.get("https://api.foursquare.com/v2/venues/" + venue_id + "/photos?oauth_token=2YEFFRGQYVIGT2EJ30RHYLGELUCW04KHQM231ZSM3HOXQFBS&v=20130511")
    @photo_data = JSON.parse(photo_query.response.body)
    @num_photos = JSON.parse(photo_query.response.body)["response"]["photos"]["count"]

    @bus_id = 1
    @revtilt_url = "http://revtilt.com/api/v1/organizations/" + @bus_id.to_s + ".json?page=1"
  end

  def about
  end
end
