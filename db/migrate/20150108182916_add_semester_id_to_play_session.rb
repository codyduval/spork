class AddSemesterIdToPlaySession < ActiveRecord::Migration
  def change
    add_column :play_sessions, :semester_id, :integer
  end
end
