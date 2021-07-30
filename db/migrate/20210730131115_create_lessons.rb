class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.datetime :start_datetime, null: false
      t.text :zoom_url, null: false, default: 'https://zoom.us/jp-jp/meetings.html'
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
