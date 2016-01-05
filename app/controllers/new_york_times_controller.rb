class NewYorkTimesController < ApplicationController
  NYT_API_KEY = 'f528e2fc1d19595d065143ed0b6aa700:18:26374763'
  NYT_BASE_URL = "http://api.nytimes.com/svc/events/v2/listings.json"

  def index

    event_string =  if params[:event_type].present?
                      params[:event_type]
                      
                    else
                      "Theater"
                    end
    @events = query_nyt(event_string)
    @results = @events['results']
  end

  private

  def query_nyt(event)
    url_params  = "?&filters=category:(#{event})&api-key=#{NYT_API_KEY}"
    url         = NYT_BASE_URL + url_params
    response = HTTParty.get(url)
    JSON.parse response.body
  end
end
