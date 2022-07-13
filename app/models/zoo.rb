class Zoo < ApplicationRecord

  has_many :animals, dependent: :destroy, foreign_key: 'tag_id'
  has_many :tags, through: :animals
  # belongs_to :user

   has_one_attached :image

   validates :name, presence: true
   validates :favorite, presence: true
   validates :assessment, presence: true
   validates :address, presence: true

end
