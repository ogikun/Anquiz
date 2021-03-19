class Tag < ApplicationRecord
  validates :tag, presence: true, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many :lists, dependent: :destroy, through: :taggings
end
