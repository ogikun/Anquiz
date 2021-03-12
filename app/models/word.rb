class Word < ApplicationRecord
  has_many :add_words, dependent: :destroy
end
