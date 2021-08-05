class CreateLessonResavations < ActiveRecord::Migration[6.1]
  def change
    create_table :lesson_resavations do |t|
      t.references :student, null: false, foreign_key: true, index: false
      t.references :lesson, null: false, foreign_key: true

      t.timestamps
    end
    add_index :lesson_resavations, %i[student_id lesson_id], unique: true
  end
end
