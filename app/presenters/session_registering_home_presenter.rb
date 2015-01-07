class SessionRegisteringHomePresenter

  def initialize(parent, children, open_semesters, sessions)
    @parent = parent
    @children = children
    @open_semesters = open_semesters
    @sessions = sessions
  end

  def home
    formatted_sessions 
  end

  def formatted_sessions
    formatted_sessions = []
    @sessions.each do |session|
      formatted_session = {}
      formatted_session[:name] = session.name
      formatted_session[:start_time] = session.start_time.to_formatted_s(:time)
      formatted_session[:end_time] = session.end_time.to_formatted_s(:time)
      formatted_session[:days_of_week] = days_of_week(session)
      formatted_sessions << formatted_session
    end
    formatted_sessions
  end

  def days_of_week(session)
    dow = []
    dow << "Monday" if session.monday == true
    dow << "Tuesday" if session.tuesday == true
    dow << "Wednesday" if session.wednesday == true
    dow << "Thursday" if session.thursday == true
    dow << "Friday" if session.friday == true
    dow << "Saturday" if session.saturday == true
    dow << "Sunday" if session.sunday == true
    dow.join('/')
  end

end
