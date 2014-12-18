class AddSemsterIdToPlaySessions < ActiveRecord::Migration
  def change
    change_table(:play_sessions) do |t|
      t.column :semester_id, :integer
    end
  end
end
