class EventController < ApplicationController

  def index
    @users = User.order("created_at ASC").all
  end

end
