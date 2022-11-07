class Opening < ApplicationRecord
  has_many :resources
  has_many :studies
  has_many :common_positions
end
