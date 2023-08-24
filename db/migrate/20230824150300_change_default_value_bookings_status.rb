class ChangeDefaultValueBookingsStatus < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :status, "Pending"
  end
end
