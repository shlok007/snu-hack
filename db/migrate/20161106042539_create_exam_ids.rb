class CreateExamIds < ActiveRecord::Migration[5.0]
  def change
    create_table :exam_ids do |t|
    	t.integer :student_id
    	t.string :aadhar_number
      t.timestamps
    end
  end
end
