class Word < ApplicationRecord
  # has_many :add_words, dependent: :destroy
  # has_many :lists, through: :add_words
  belongs_to :list
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
