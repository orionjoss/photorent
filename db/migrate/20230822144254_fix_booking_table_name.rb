class FixBookingTableName < ActiveRecord::Migration[7.0]
  def change
    rename_table :bookings_tables, :bookings
  end
end
