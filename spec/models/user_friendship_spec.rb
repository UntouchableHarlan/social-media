require 'rails_helper'

RSpec.describe UserFriendship, type: :model do
  it "should belong to a user" do
    should belong_to(:user)
    should belong_to(:friend)
  end

  it "that creating friendship should work" do
      UserFriendship.create(user: User.find(1), friend: User.find(2))
  end
end
