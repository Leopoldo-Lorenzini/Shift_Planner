class AddStartingPlaceToItineraries < ActiveRecord::Migration[7.1]
  def change
    add_reference :itineraries, :starting_place, null: false, foreign_key: { to_table: :places }
  end
end
