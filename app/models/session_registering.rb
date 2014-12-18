# Primary Actor: a regular user cast as a parent
# Goal: parent registers their child for an open play sesssion
# Supporting Actors: the parent's child, a play session
# Preconditions: parent is already authenticated and registered

class SessionRegistering

  def self.start(current_user_id)
    SessionRegistering.new.start(current_user_id)
  end

  def self.browse(semester_id)
    SessionRegistering.new.browse(semester_id)
  end

  def self.register(child_id, play_session_id)
    SessionRegistering.new.register(child_id, play_session_id)
  end

  def start(current_user_id)
    parent = find_person(current_user_id).extend(Parent)
    children = parent.children
    semesters = open_semesters
    {:children => children, :semesters => semesters}
  end

  def browse(semester_id)
    semester = find_semester(semester_id).extend(SelectedSemester)
    open_sessions = semester.open_sessions
    open_sessions
  end

  def register(child_id, play_session_id)
    child = find_child(child_user_id)
    play_session = find_play_session(play_session_id).extend(OpenPlaySession)
    play_session.add(child)
    play_session.save
  end

  def finish(registration_id)
    confirm = find_registration(registration_id)
  end

  module SelectedSemester
    def open_sessions
      self.play_sessions
    end
  end

  module Parent
    def children
      self.children
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
