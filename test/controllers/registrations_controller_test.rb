require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "creates an account with name email and password" do
    assert_difference "User.count", 1 do
      post user_registration_path, params: {
        user: {
          name: "Maria Demo",
          email: "maria@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_redirected_to root_path
    assert_equal "Maria Demo", User.find_by!(email: "maria@example.com").name
  end
end
