class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :registrations
  has_many :play_sessions, :through => :registrations
  has_many :children, class_name: "User", foreign_key: "parent_id"
  belongs_to :parent, :class_name => "User", :foreign_key => :id, :primary_key => :parent_id
=======
>>>>>>> reset-to-previous
end
