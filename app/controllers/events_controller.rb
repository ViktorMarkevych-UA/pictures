class EventsController < ApplicationController

  def index
    @users = User.order('created_at ASC').all
    @events = Event.all
  end

  def show

    case (params[:event_type])
      when 'Navigation', 'Comment', 'Like'
        @events = Event.paginate(page: params[:page]).where(user_id: params[:id], eventtable_type: params[:event_type])
      when 'User_in'
        @events = Event.paginate(page: params[:page]).where(eventtable_body: 'sign_in', user_id: params[:id])
      when 'User_out'
        @events = Event.paginate(page: params[:page]).where(eventtable_body: 'sign_out', user_id: params[:id])
      else
        @events = []
    end

  end
end
