class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :bike_id
      t.datetime :start_at
      t.datetime :end_at
      t.boolean :canceled

      t.timestamps
    end

    add_index :schedules, :user_id
    add_index :schedules, :bike_id
  end
end
