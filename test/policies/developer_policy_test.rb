require "test_helper"

class DeveloperPolicyTest < ActiveSupport::TestCase
  test "update their own developer profile" do
    user = users(:one)
    developer = developers(:one)

    assert DeveloperPolicy.new(user, developer).update?
  end

  test "cannot update another's developer profile" do
    user = users(:one)
    developer = developers(:two)

    refute DeveloperPolicy.new(user, developer).update?
  end

  test "can create developer profile if they do not already have one" do
    user = users(:three)
    developer = user.developer

    assert DeveloperPolicy.new(user, developer).create?
  end

  test "cannot create developer profile for self if they already have one" do
    user = users(:one)
    developer = user.developer

    refute DeveloperPolicy.new(user, developer).create?
  end
end
