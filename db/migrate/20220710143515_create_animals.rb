class CreateAnimals < ActiveRecord::Migration[6.1]
  def change
    create_table :animals do |t|

      t.string :name, null: false, default: ""
      t.text :introduction, null: false, default: ""

      # #タグ機能
      # t.references :animal, foreign_key: true
      # t.references :tag, foreign_key: true


      t.timestamps
    end

    # 同じタグを２回保存するのは出来ないようになる
    # add_index :animals, [:animal_id, :tag_id], unique: true

  end
end
