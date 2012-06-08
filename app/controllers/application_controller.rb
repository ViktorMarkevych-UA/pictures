class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :event_links
  #
  #def event_links
  #  puts "-"*100
  #  puts request.env["REQUEST_URI"]
  #  puts current_user.id
  #  event = Event.new
  #  event.event_type = "User"
  #  event.event_id = current_user.id
  #  #event.type = "links"
  #  #event.body = request.env["REQUEST_URI"]
  #  event.save
  #end
end
