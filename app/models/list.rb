class List < ApplicationRecord
  validates :title, presence: true
  validates :about, presence: true

  belongs_to :user
  has_many :words, dependent: :destroy, through: :add_words
  has_many :add_words

end
