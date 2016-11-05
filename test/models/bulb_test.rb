require 'test_helper'

class BulbTest < ActiveSupport::TestCase

  def setup
    @user = User.create!(name: "Ellis", email: "ellis@example.com", provider: "seed")
    @bulb = Bulb.new(user_id: @user.id, bright: "Lots of test text", dim: "Even more test text", blocked: "Final block of test text.", likes: 0, panic_score: 10)
  end

  test "should be valid" do
    assert @bulb.valid?
  end

  test "user_id should be present" do
    @bulb.user_id = "   "
    assert_not @bulb.valid?
  end

  test "bright should be present" do
    @bulb.bright = "    "
    assert_not @bulb.valid?
  end

  test "dim should be present" do
    @bulb.dim = "   "
    assert_not @bulb.valid?
  end

  test "blocked should be present" do
    @bulb.blocked = "   "
    assert_not @bulb.valid?
  end

end
