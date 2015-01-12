class SessionRegistrationController < ApplicationController

<<<<<<< HEAD
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
=======
  def home
    current_user = User.last
    @sessions = SessionRegistering.start(current_user.id)
>>>>>>> reset-to-previous
  end

  def open_sessions
    current_user = User.last
    view = SessionRegistering.start(current_user.id)
    render json: view
  end
>>>>>>> add-react

  def register
    play_session = SessionRegistering.register(child_id: params[:child_id], play_session_id: params[:play_session_id])
    if play_session
      #yay
    else
      #some sort of flash error
    end
  end

end
