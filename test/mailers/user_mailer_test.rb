require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
    test "account_activation" do
    user = users(:ippei)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["tokutoku@example.com"], mail.from
    # assert_match user.name,               mail.body
    # assert_match user.activation_token,   mail.body
    # assert_match CGI.escape(user.email),  mail.body
  end

end
