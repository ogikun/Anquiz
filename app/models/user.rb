class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,:registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :words, dependent: :destroy, through: :favorites
  has_many :mylists, dependent: :destroy
  has_many :lists, dependent: :destroy, through: :mylists
  has_many :comments, dependent: :destroy

  validates :name, presence: true
end
