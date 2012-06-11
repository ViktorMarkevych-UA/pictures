class EventController < ApplicationController

  def index
    @users = User.order("created_at ASC").all
    @eve = Event.all
  end

  def show
    #@events = Event.find_all_by_user_id_and_eventtable_type(params[:id], params[:type])
    @event = Event.find_by_eventtable_id(params[:id])
    @event.update_attributes(:eventtable_body => params[:body])
    #@event = Comment.find_all_by_user_id(params[:id])
  end

end
