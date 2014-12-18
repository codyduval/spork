class SessionRegistrationController < ApplicationController
respond_to :html

  def index
    @children = current_user.children
    @semesters = Semester.where(:open_for_reg => true)
  end

  def play_sessions
    @play_sessions = SessionBrowsing.call(params[:semester_id])
  end

  def register
    registration = SessionRegistering.call(params[:child_user_id],
                                          params[:play_session_id])

    respond_with play_session do |format|
      format.html { redirect_to play_sessions_path(play_session) }
    end
  end

end
