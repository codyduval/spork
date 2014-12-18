class CreatePlaySessions < ActiveRecord::Migration
  def change
    create_table :play_sessions do |t|

      t.timestamps
    end
  end
end
