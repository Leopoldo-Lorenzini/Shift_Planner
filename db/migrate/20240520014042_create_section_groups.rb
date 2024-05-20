class CreateSectionGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :section_groups do |t|
      # t.string :piloto_id
      
      t.string :n_asientos
      t.string :presio
      t.string :hora_salida
      t.string :hora_llegada

      # t.string :lugar_salida
      # t.string :lugar_llegada
      
      # t.string :inineray_id

      t.timestamps
    end
  end
end
