class AddBasicInfoToPlaySession < ActiveRecord::Migration
  def change
    change_table(:play_sessions) do |t|
      t.column :name, :string
      t.column :start_time, :time
      t.column :end_time, :time
      t.column :monday, :boolean
      t.column :tuesday, :boolean
      t.column :wednesday, :boolean
      t.column :thursday, :boolean
      t.column :friday, :boolean
      t.column :saturday, :boolean
      t.column :sunday, :boolean
      t.column :capacity, :integer
    end
  end
end
