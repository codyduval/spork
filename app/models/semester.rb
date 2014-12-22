class Semester < ActiveRecord::Base
  has_many :play_sessions
end
