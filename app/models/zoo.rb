class Zoo < ApplicationRecord

  has_many :zoo_animals, dependent: :destroy
  has_many :animals, through: :zoo_animals
  # belongs_to :user

   has_one_attached :image

   validates :name, presence: true
   validates :favorite, presence: true
   validates :assessment, presence: true
   validates :address, presence: true

   def save_animal(sent_animals)
     current_animals = self.animals.pluck(:name) unless self.animal.nil?
     old_animals = current_animals - sent_animals
     new_animals = sent_animals - current_animals

     old_animals.each do |old|
       self.animals.delete Animal.find_by(name: old)
     end

     new_animals.each do |new|
       new_zoo_animal = Animal.find_or_create_by(name: new)
       self.animals << new_zoo_animal
     end
   end

end