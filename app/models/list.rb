class List < ApplicationRecord
  validates :title, presence: true
  validates :about, presence: true

  belongs_to :user
  has_many :add_words, dependent: :destroy
  has_many :words, dependent: :destroy, through: :add_words
  has_many :mylists, dependent: :destroy
  has_many :users, dependent: :destroy, through: :mylists
  has_many :comments, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, dependent: :destroy, through: :taggings

end
