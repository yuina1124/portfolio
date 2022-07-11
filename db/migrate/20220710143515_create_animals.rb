class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|

      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""

      t.timestamps
    end
  end
end
