# Primary Actor: a regular user cast as a parent
# Goal: parent registers their child for an open play sesssion
# Supporting Actors: the parent's child, a play session
# Preconditions: parent is already authenticated and registered

class SessionRegistering
  attr_accessor :parent, :child, :semester, :play_session

  def initialize(current_user_id: nil,semester_id:  nil,
                 child_id:  nil, play_session_id:  nil,
                 reg_id:  nil)
    @parent = find_person(current_user_id).extend(Parent)
    @child = find_person(child_user_id).extend(Child)
    @semester = find_semester(semester_id).extend(SelectedSemester)
    @play_session = find_play_session(play_session_id).extend(OpenPlaySession)

  end

  def self.start(current_user_id)
    SessionRegistering.new(current_user_id: current_user_id).start
  end

  def self.browse(semester_id)
    SessionRegistering.new(semester_id: semester_id).browse
  end

  def self.register(child_id, play_session_id)
    SessionRegistering.new(child_id: child_id, play_session_id: play_session_id).register
  end

  def self.finish(registration_id)
    SessionRegistering.new(reg_id: registration_id).finish
  end

  def start
    {:children => @parent.children, :semesters => open_semesters}
  end

  def browse
    open_sessions = @semester.open_sessions
    open_sessions
  end

  def register
    @play_session.add(child)
    if @play_session.save
      @play_session
    else
      false
    end
  end

  def finish
    confirm = find_registration(registration_id)
  end

  module Child
  end

  module Parent
    def children
      self.children
    end
  end

  module SelectedSemester
    def open_sessions
      self.play_sessions
    end
  end

  module OpenPlaySession
    def add(child)
      self.children << child
    end
  end

  def find_semester(semester_id)
    Semester.find_by_id(semester_id)
  end

  def find_person(user_id)
    User.find_by_id(child_id)
  end

  def find_play_session(play_session_id)
    PlaySession.find_by_id(play_session_id)
  end

  def open_semesters
    Semester.where(:open_for_reg => true)
  end

  def find_registration
    Registration.find_by_id(registration_id)
  end

end
