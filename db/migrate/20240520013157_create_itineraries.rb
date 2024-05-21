class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      t.string :status # define si es pasagero o conductor
      t.boolean :is_active, default: true # Cambiado a tipo booleano con valor predeterminado de true
      t.string :day
      t.string :h_start
      t.string :h_end

      t.timestamps
    end
  end
end
