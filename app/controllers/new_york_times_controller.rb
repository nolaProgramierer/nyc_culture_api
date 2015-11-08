class NewYorkTimesController < ApplicationController
  def index

    key = 'f528e2fc1d19595d065143ed0b6aa700:18:26374763'
    response = HTTParty.get("http://api.nytimes.com/svc/events/v2/listings.json?&filters=category:(#{event})&api-key=#{key}")
    # returns a series of arrays
    @events = JSON::parse(response.body)
    # isolates the 'results' array of hashes
    @results = @events['results']

  end

  def event
    "Dance"
  end
  # def select_event(event)
  #   @event = event
  # end


  # def method(event)
  #   @event = event
  # end


end
