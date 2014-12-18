class SessionRegistrationController < ApplicationController
respond_to :html

  def register
    registration = SessionRegistering.new(params[:parent_user_id],
                                          params[:child_user_id],
                                          params[:play_session_id])
    play_session = registration.execute

    respond_with play_session do |format|
      format.html { redirect_to play_sessions_path(play_session) }
    end
  end

end
