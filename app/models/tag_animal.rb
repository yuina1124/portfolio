class TagAnimal < ApplicationRecord

  belongs_to :animal
  belongs_to :tag

  validates :animal_id, presence:true
  validates :tag_id, presence: true

end
