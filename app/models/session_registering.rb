# Primary Actor: a regular user cast as a parent
# Goal: parent registers their child for an open play sesssion
# Supporting Actors: the parent's child, a play session
# Preconditions: parent is already authenticated and registered

class SessionRegistering
   def initialize(parent_user_id, child_user_id, play_session_id)
     @child = find_child(child_user_id)
     @user = find_parent(parent_user_id)
     @play_session = find_play_session(play_session_id)
   end

   #Trigger: parent selects play session to register for 
   def execute
     @parent.assign_child_to_session(@child, @play_session)
     #2. system assigns child to session
     #3. parent submits payment
     #4. parent receives confirmation via email
     @play_session
   end

  module Parent
    def assign_child_to_session(child, play_session)
      child.play_sessions << play_session
      child.save
    end
  end

  def find_child(child_id)
    child = User.find_by_id(child_id)
  end

  def find_parent(parent_id)
    parent = User.find_by_id(parent_id)
    parent = parent.extend(Parent)
  end

  def find_play_session(play_session_id)
    play_session = PlaySession.find_by_id(play_session_id)
  end

end
