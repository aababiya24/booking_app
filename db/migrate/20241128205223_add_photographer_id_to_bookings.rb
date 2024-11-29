class AddPhotographerIdToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :photographer_id, :integer
    add_index :bookings, :photographer_id 
  end
end
