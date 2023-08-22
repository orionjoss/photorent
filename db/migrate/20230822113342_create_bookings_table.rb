class CreateBookingsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings_tables do |t|
      t.date :start_date
      t.date :end_date
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :camera, null: false, foreign_key: true

      t.timestamps
    end
  end
end
