class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.column :name, :string
      t.column :start_date, :datetime
      t.column :end_date, :datetime
      t.column :open_for_reg, :boolean
      t.timestamps
    end
  end
end
