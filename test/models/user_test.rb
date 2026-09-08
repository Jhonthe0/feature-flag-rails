require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "requires a name" do
    user = User.new(email: "teste@example.com", password: "password123", name: "")

    assert_not user.valid?
  end
end
