class AddDobToStudents < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :dob, :string
  end
end
