class CreateAddharCards < ActiveRecord::Migration[5.0]
  def change
    create_table :addhar_cards do |t|
      t.string :number
      t.string :name
      t.string :mothers_name
      t.string :fathers_name

      t.timestamps
    end
  end
end
