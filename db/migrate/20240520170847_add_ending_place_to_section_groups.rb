class AddEndingPlaceToSectionGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :section_groups, :ending_place, null: false, foreign_key: { to_table: :places }
  end
end
