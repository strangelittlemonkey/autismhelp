class BusinessController < ApplicationController
  def index
  end

  def show
    @lat = 40.7
    @lng = -74
    @venue_query = HTTParty.get('https://api.foursquare.com/v2/venues/search?ll=' + @lat.to_s + ',' + @lng.to_s + '&oauth_token=2YEFFRGQYVIGT2EJ30RHYLGELUCW04KHQM231ZSM3HOXQFBS&v=20130511')
  end
end
