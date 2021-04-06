class Word < ApplicationRecord
  belongs_to :list
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
