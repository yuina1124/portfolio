class Animal < ApplicationRecord

  has_one_attached :image

  has_many :tag_animals, dependent: :destroy
  has_many :tags, through: :tag_animals
  belongs_to :zoo
  belongs_to :tag

  validates :name, presence: true
  validates :introduction, presence: true

  # def self.animal_search(search)
  #   Animal.where(['title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%"])
  # end

  def save_animals(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name:old)
    end

    new_tags.each do |new|
      new_animal_tag = Tag.find_or_creare_by(name:new)
      self.tags << _new_animal_tag
    end
  end
end
