class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|

      t.string :name, null: false, default: ""
      t.string :favorite, null: false, default: ""
      t.integer :type, null: true, default: ""
      t.integer :many, null: true, default: ""
      t.integer :assessment, null: false, default: ""
      t.string :address, null: false, default: ""
      t.references :users, null: true, foreign_key: true


      t.timestamps
    end
  end
end
