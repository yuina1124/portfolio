class CreateTagAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_animals do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
