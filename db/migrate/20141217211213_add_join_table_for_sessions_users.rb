class AddJoinTableForSessionsUsers < ActiveRecord::Migration
  def change
    create_table :play_sessions_users, id: false do |t|
      t.integer :user_id
      t.integer :play_session_id
    end
  end
end
