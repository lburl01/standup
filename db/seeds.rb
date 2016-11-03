
# class Bulb < ApplicationRecord
#   validates :bright, :dim, :blocked, presence: true
#
# class Comment < ApplicationRecord
#   validates :user_id, :comment, :bulb_id, presence: true

# class User
#   validates :name, :email, presence: true

User.create!(name: "Ellis", email: "ellis@example.com", provider: "seed")
User.create!(name: "Samantha", email: "Samantha@example.com", provider: "seed")
User.create!(name: "Miles", email: "miles@example.com", provider: "seed")

Bulb.create!(user_id: 1, bright: "I got OAuth to work!", dim: "Users have to be authenticated each time they visit the site", blocked: "Structure of our Angular/Rails app", panic_score: 5)
Bulb.create!(user_id: 2, bright: "I'm a genius", dim: "It took me 3 hours to do something", blocked: "Finding the hex color of my favorite sweater", panic_score: 2)
Bulb.create!(user_id: 3, bright: "I made a button!", dim: "My button doesn't go anywhere yet", blocked: "I still can't make sushi", panic_score: 4)
Bulb.create!(user_id: 1, bright: "Yay!", dim: "Boo", blocked: "So stuck", panic_score: 6)

Comment.create!(user_id: 1, comment: "Proud of you!", bulb_id: 2)
Comment.create!(user_id: 2, comment: "I've also had that problem. Stick with it.", bulb_id: 1)
Comment.create!(user_id: 3, comment: "Woo-hoo.", bulb_id: 3)
