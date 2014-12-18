class PlaySession < ActiveRecord::Base
  has_many :registrations
  has_many :users, :through => :registrations
  has_many :children, :through => :registrations, :source => :user 
  belongs_to :semester
end
