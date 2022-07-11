class CreateZoos < ActiveRecord::Migration[6.1]
  def change
    create_table :zoos do |t|

      t.string :name, null: false, default: ""
      t.string :favorite, null: false, default: ""
      t.integer :type, null: false, default: ""
      t.integer :many, null: false, default: ""
      t.integer :assessment, null: false, default: ""
      t.string :address, null: false, default: ""

      t.timestamps
    end
  end
end
