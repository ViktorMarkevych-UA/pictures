class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html { redirect_to user_path(current_user), notice: 'Is Updated!' }
        format.json
      else
        format.html { render action: 'edit' }
        format.json { render json: current_user.errors.full_messages, status: :unprocessable_entity }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
