class SessionRegistrationController < ApplicationController

  def index
<<<<<<< HEAD
    @children = current_user.children
    @semesters = Semester.where(:open_for_reg => true)
  end

  def play_sessions
    @play_sessions = SessionBrowsing.call(params[:semester_id])
  end

  def register
    registration = SessionRegistering.call(params[:child_user_id],
                                          params[:play_session_id])
=======
    current_user = User.last
    setup = SessionRegistering.start(current_user.id)
    @children = setup[:children]
    @semesters = setup[:semesters]
    #@view = SessionRegistrationView.index
  end

  def browse
    open_sessions = SessionRegistering.browse(semester_id: params[:semester_id])
    @open_sessions = open_sessions.to_json
  end
>>>>>>> add-react

  def register
    play_session = SessionRegistering.register(child_id: params[:child_id], play_session_id: params[:play_session_id])
    if play_session
      redirect_to confirmation
    else
      #some sort of flash error
    end
  end

  def confirmation
    @confirmation = SessionRegistering.finish(reg_id: params[:registration_id])
  end

end
