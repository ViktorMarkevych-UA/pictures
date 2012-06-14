class SessionsController < Devise::SessionsController

  # GET /resource/sign_in
  def new
    "c"
    super
    Event.create
  end

  # DELETE /resource/sign_out
  def destroy
    user = current_user
    super
    if !user_signed_in? and user
        Event.create
    end
  end

end