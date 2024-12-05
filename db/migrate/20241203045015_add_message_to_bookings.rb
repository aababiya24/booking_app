class AddMessageToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :message, :text
  end
end
