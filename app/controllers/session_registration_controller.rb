class SessionRegistrationController < ApplicationController

  def home
    current_user = User.first
    @home = SessionRegistering.start(current_user.id)
  end

  def open_sessions
    current_user = User.first
    view = SessionRegistering.start(current_user.id)
    render json: view
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
