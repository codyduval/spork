class SessionRegistrationController < ApplicationController

  def home
    #temp until authorization/authenticatin
    current_user = User.last
    view = SessionRegistering.start(current_user.id)
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
