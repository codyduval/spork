class AddNameEmailToUser < ActiveRecord::Migration
  def change
    change_table(:users) do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :age_years, :integer
      t.column :age_months, :integer
      t.column :admin, :boolean
      t.column :parent_id, :integer
    end
  end
end
