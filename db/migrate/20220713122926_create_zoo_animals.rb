class CreateZooAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :zoo_animals do |t|

      t.references :animal, foreign_key: true
      t.references :zoo, foreign_key: true

      t.timestamps
    end

      add_index :zoo_animals, [:animal_id, :zoo_id], unique: true

  end
end
