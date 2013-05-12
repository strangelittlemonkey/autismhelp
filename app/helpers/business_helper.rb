module BusinessHelper

  def get_current_location 
    # Current location is grabbed via html5 
    # navigator.geolocation.getCurrentPosition when lat & lng are nil
    @lat = nil
    @lng = nil
  end

end
