class Word < ApplicationRecord
  has_many :lists, dependent: :destroy, through: :add_words
  has_many :add_words, dependent: :destroy
  has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy
end
