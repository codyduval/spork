class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.column :name, :string
      t.column :start_date, :datetime
      t.column :end_date, :datetime
      t.timestamps
    end
  end
end
