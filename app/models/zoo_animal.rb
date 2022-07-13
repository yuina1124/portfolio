class ZooAnimal < ApplicationRecord

  belongs_to :animal
  belongs_to :zoo

  validates :animal_id, presence:true
  validates :zoo_id, presence:true

end
