class Comment < ApplicationRecord
  validates :user_id, :comment, :bulb_id, presence: true

  belongs_to :user
  belongs_to :bulb

end
