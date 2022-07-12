class Animal < ApplicationRecord

  has_one_attached :image

  has_many :tag_animals, dependent: :destroy
  has_many :tags, through: :tag_animals
  belongs_to :zoo
  belongs_to :tag

  validates :name, presence: true
  validates :introduction, presence: true

  def self.animal_search(search)
    Animal.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  end

  def save_animals(tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name:old_name)
    end
    new_tags.each do |new_name|
      animal_tag = Tag.find_or_creare_by(tag_name:new_name)
      self.tags << animal_tag
    end
  end
end
