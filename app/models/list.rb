class List < ApplicationRecord
  validates :title, presence: true
  validates :about, presence: true

  belongs_to :user
  has_many :add_words, dependent: :destroy

end
