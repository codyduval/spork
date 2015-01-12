class PlaySession < ActiveRecord::Base
<<<<<<< HEAD
  has_many :registrations
  has_many :users, :through => :registrations
  has_many :children, :through => :registrations, :source => :user 
  belongs_to :semester
=======
  belongs_to :semester
<<<<<<< HEAD
  has_and_belongs_to_many :users
>>>>>>> add-react
=======
>>>>>>> reset-to-previous
end
