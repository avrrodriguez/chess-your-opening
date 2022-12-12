class Opening < ApplicationRecord
  has_many :resources
  has_many :studies
  has_many :common_positions
  has_many :users, through: :studies
  has_many :posts

  validates :name, presence: true
  validates :description, presence: true
  validates :difficulty, presence: true
  validates :variation, presence: true
end
