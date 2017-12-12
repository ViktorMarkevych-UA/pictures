class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :event_links

  layout :select_layout

  def event_links
    if user_signed_in?
      current_user.events.create(eventtable_type: 'Navigation',
                                 eventtable_body: request.env['REQUEST_URI'] )
    end
  end

  protected

  def select_layout
    devise_controller? ? 'authorization' : 'application'
  end
end