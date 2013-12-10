require "spec_helper"

describe UserMailer do

  before :each do
    user = User.create! valid_attributes
    user.update_attribute(:role, 1)
  end

  describe "Send Welcome Email" do
    email = UserMailer.welcome_email(user)
    assert !ActionMailer::Base.deliveries.empty?

    # Test the body of the sent email contains what we expect it to
    assert_equal ['projmule@gmail.com'], email.from
    assert_equal user.email, email.to
    assert_equal 'Welcome to LuckyBolt!', email.subject
    #assert_equal read_fixture('invite').join, email.body.to_s
  end
end
