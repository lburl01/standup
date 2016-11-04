class Bulb < ApplicationRecord
  validates :bright,  presence: true
  validates :dim, presence: true
  validates :blocked, presence: true
  validates :panic_score, format: { with: /\d/ }

  belongs_to :user
  has_many :comments

end
