# Primary Actor: a regular user cast as a parent
# Goal: parent registers their child for an open play sesssion
# Supporting Actors: the parent's child, a play session
# Preconditions: parent is already authenticated and registered

class SessionBrowsing

  def initialize(semester_id)
    @semester = find_semester(semester_id).extend(OpenSessions)
  end

  def self.call(semester_id)
    SessionBrowsing.new(semester_id).call
  end

  module OpenSessions
    def open_sessions
      self.play_sessions
    end
  end

  #Trigger: parent selects play session to register for 
  def call
    open_sessions = @semester.open_sessions
    open_sessions.to_json
  end

  def find_semester(semester_id)
    Semester.find_by_ide(semester_id)
  end

end
