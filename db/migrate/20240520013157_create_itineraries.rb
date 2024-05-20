class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      # t.string :user_id

      t.string :status # define si es pasagero o conductor
      t.string :dia
      t.string :hora_salida
      t.string :hora_llegada

      # t.string :lugar_salida
      # t.string :lugar_llegada

      # t.string :section_groups_id

      t.timestamps
    end
  end
end
