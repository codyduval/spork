class User < ActiveRecord::Base
  has_and_belongs_to_many :play_sessions
  has_many :children, class_name: "User", foreign_key: "parent_id"
  belongs_to :parent, :class_name => "User", :foreign_key => :id, :primary_key => :parent_id
end
