class AddUserToSectionGroups < ActiveRecord::Migration[7.1]
  def change
    add_reference :section_groups, :user, null: false, foreign_key: true
  end
end
