class CreateSectionGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :section_groups do |t|
      # t.string :piloto_id
      
      t.string :n_seats
      t.string :cost
      t.string :h_start
      t.string :h_end

      # t.string :lugar_salida
      # t.string :lugar_llegada
      
      # t.string :inineray_id

      t.timestamps
    end
  end
end
