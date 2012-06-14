class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :event_links

  def event_links
    Event.create(:eventtable_type => "Navigation", :user_id => current_user.id, :eventtable_body => request.env["REQUEST_URI"] )
  end
end