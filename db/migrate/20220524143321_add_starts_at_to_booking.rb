class AddStartsAtToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :starts_at, :date
    add_column :bookings, :ends_at, :date
  end
end
