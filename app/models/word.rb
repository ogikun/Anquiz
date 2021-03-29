class Word < ApplicationRecord
  has_many :add_words, dependent: :destroy
  has_many :lists, dependent: :destroy, through: :add_words
  has_many :favorites, dependent: :destroy
  has_many :users, dependent: :destroy, through: :favorites
end
