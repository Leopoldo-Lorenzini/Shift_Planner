class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :password
      t.string :phone
      t.string :description
      t.string :data

      t.timestamps
    end
  end
end