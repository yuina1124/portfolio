class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      
      t.string :name, null: false
      t.references :animal, null: false, foreign_key: true
      t.string :tag_name,   null: false, default: ""

      t.timestamps
    end
  end
end
