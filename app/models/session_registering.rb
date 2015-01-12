# Primary Actor: a regular user cast as a parent
# Goal: parent registers their child for an open play sesssion
# Supporting Actors: the parent's child, a play session
# Preconditions: parent is already authenticated and registered

class SessionRegistering
<<<<<<< HEAD
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
=======
  attr_accessor :parent, :child, :semester, :play_session

  def initialize(current_user_id: nil,semester_id:  nil,
                 child_user_id: nil, play_session_id:  nil,
                 reg_id:  nil)
    @child = find_person(child_user_id).extend(Child) if child_user_id
    @semester = find_semester(semester_id).extend(SelectedSemester) if semester_id
    @play_session = find_play_session(play_session_id).extend(OpenPlaySession) if play_session_id
  end

  def self.start(current_user_id)
    parent = User.find(current_user_id).extend(Parent)
    sessions = PlaySession.all
    SessionRegisteringHomePresenter.new(parent, parent.kids, open_semesters, sessions).home
  end

  def self.register(child_id, play_session_id)
    SessionRegistering.new(child_id: child_id, play_session_id: play_session_id).register
  end

  def register
    @play_session.add(child)
    if @play_session.save
      @play_session
    else
      false
    end
  end

  module Child
    def parent 
      self.class.class_eval do
        belongs_to :parent, :class_name => "User", :foreign_key => :id, :primary_key => :parent_id
      end
      self.parent
    end

    def play_sessions
      self.class.class_eval do
        has_and_belongs_to_many :play_sessions
      end
      self.play_sessions
    end
  end

  module Parent
    def kids
      self.class.class_eval do
        has_many :children, class_name: "User", foreign_key: "parent_id"
      end
      self.children
    end
  end

  module SelectedSemester
>>>>>>> add-react
    def open_sessions
      self.play_sessions
    end

    def play_sessions
      self.class.class_eval do
        has_many :play_sessions
      end
    end
  end

  module OpenPlaySession
    def add(child)
      self.children << child
    end
<<<<<<< HEAD
<<<<<<< HEAD
=======

    def kids
      self.class.class_eval do
        has_and_belongs_to_many :users
      end
      self.children
    end
>>>>>>> reset-to-previous
  end

  def find_semester(semester_id)
    Semester.find(semester_id)
  end

<<<<<<< HEAD
  def find_child(child_id)
    User.find_by_id(child_id)
  end

  def find_play_session(play_session_id)
    PlaySession.find_by_id(play_session_id)
=======
  end

  def find_semester(semester_id)
    Semester.find(semester_id)
  end

  def find_person(user_id)
    User.find(user_id)
  end

  def find_play_session(play_session_id)
=======
  def find_person(user_id)
    User.find(user_id)
  end

  def find_play_session(play_session_id)
>>>>>>> reset-to-previous
    PlaySession.find(play_session_id)
  end

  def self.open_semesters
    Semester.where(:open_for_reg => true)
  end

  def find_registration
<<<<<<< HEAD
    Registration.find_by_id(registration_id)
>>>>>>> add-react
=======
    Registration.find(registration_id)
>>>>>>> reset-to-previous
  end

end
