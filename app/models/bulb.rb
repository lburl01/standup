class Bulb < ApplicationRecord
  validates :bright, :dim, :blocked, presence: true

  belongs_to :user
  has_many :comments

end
