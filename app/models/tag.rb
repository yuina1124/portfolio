class Tag < ApplicationRecord

  has_many :animals, through: :tag_animals
  has_many :zoos, through: :animals
  has_many :tag_animals, dependent: :destroy, foreign_key: 'tag_id'

  validates :name, uniqueness: true, presence: true

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tag.delete  Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_animal = Tag.find_or_create_by(name: new)
      self.tags << new_animal
    end
  end
end
