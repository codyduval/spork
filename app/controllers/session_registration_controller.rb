class SessionRegistrationController < ApplicationController

  def home
    view = SessionRegistering.start(current_user_id: current_user.id)
    @view.as_json
  end

  def register
    play_session = SessionRegistering.register(child_id: params[:child_id], play_session_id: params[:play_session_id])
    if play_session
      #yay
    else
      #some sort of flash error
    end
  end

end
