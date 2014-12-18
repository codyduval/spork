class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.belongs_to :play_session
      t.belongs_to :user
      t.datetime :registration_date
      t.timestamps
    end
    
    drop_table :play_sessions_users
  end
end
