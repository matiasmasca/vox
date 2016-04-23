class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :usuario
      t.string :nombre
      t.string :apellido
      t.string :email
      t.string :clave
      t.string :facebook
      t.string :twitter
      t.integer :tipo_usuario_id, default: 2, null: false #2= Jurado.

      t.timestamps
    end
  end
  def down
    drop_table :users
  end
end
