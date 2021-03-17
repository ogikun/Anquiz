class Tag < ApplicationRecord
  validates :tag, presence: true, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :list, dependent: :destroy, through: :taggings
end
