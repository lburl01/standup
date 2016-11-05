require 'test_helper'

class BulbsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(name: "Ellis", email: "ellis@example.com", provider: "seed")
    @bulb = Bulb.create!(user_id: @user.id, bright: "I got OAuth to work!", dim: "Users have to be authenticated each time they visit the site", blocked: "Structure of our Angular/Rails app", panic_score: 5)
    @comment = Comment.new(user_id: @user.id, comment: "Proud of you!", bulb_id: @bulb.id)
  end

  test "should not save empty comment text field" do
    @comment.comment = " "
    assert_not @comment.valid?
  end

  test "should save valid comment" do
    assert @comment.valid?
  end

  test "should not save empty bright bulb text" do
    @bulb.bright = " "
    assert_not @bulb.valid?
  end

  test "should not save empty dim bulb text" do
    @bulb.dim = " "
    assert_not @bulb.valid?
  end

  test "should not save empty blocked bulb text" do
    @bulb.blocked = " "
    assert_not @bulb.valid?
  end
end
