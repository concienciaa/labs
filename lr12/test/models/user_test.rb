require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should create user" do
    user = User.new
    user.login = "abra"
    user.password = "sad"
    assert user.save
  end
end
