class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :mail
      t.string :passeword
      t.string :telefono
      t.string :descripcion
      t.string :datos

      t.timestamps
    end
  end
end