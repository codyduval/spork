# Primary Actor: a regular user cast as a parent
# Goal: parent registers their child for an open play sesssion
# Supporting Actors: the parent's child, a play session
# Preconditions: parent is already authenticated and registered

class SessionRegistering
  attr_accessor :child, :play_session

  def initialize(child_user_id, play_session_id)
   @child = find_child(child_user_id)
   @play_session = find_play_session(play_session_id).extend OpenPlaySession
  end

  def self.call(child_user_id, play_session_id)
    SessionRegistering.new(child_user_id, play_session_id).call
  end

  def self.for_semester(semester_id)
    SessionRegistering.new(child_user_id, play_session_id).call
  end

  def self.start(current_user_id)

  end

  def start(current_user_id)

  end

  def browse(semester_id)
    semester = find_semester(semester_id).extend(SelectedSession)
    open_sessions = semester.open_sessions
    open_sessions
  end

  def register(child_id, play_session_id)
    child = find_child(child_user_id)
    play_session = find_play_session(play_session_id).extend OpenPlaySession
    play_session.add(child)
    play_session.save
  end

  #Trigger: parent selects play session to register for 
  def call
    play_session.add(child)
    play_session.save
    #2. system assigns child to session
    #3. parent submits payment
    #4. parent receives confirmation via email
    @play_session
  end

  module SelectedSession
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

  def find_child(child_id)
    User.find_by_id(child_id)
  end

  def find_play_session(play_session_id)
    PlaySession.find_by_id(play_session_id)
  end

end
