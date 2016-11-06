class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :fathers_name
      t.string :mothers_name
      t.string :aadhar_no

      t.timestamps
    end
  end
end
