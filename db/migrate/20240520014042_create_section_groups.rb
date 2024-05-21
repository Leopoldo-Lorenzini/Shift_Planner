class CreateSectionGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :section_groups do |t|
      
      t.string :n_seats
      t.string :cost
      t.string :h_start
      t.string :h_end

      t.timestamps
    end
  end
end
