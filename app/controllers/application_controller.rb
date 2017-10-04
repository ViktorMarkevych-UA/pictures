class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :event_links

  def event_links
    Event.create(:eventtable_type => "Navigation", :user_id => current_user.id, :eventtable_body => request.env["REQUEST_URI"] ) if current_user
  end
end