class Zoo < ApplicationRecord

  has_many :animals, dependent: :destroy
  belongs_to :user

   has_one_attached :image

end
