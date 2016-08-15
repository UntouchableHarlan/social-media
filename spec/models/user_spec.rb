require 'rails_helper'

RSpec.describe User, type: :model do
  it "should belong to a user" do
    should belong_to(:user)
  end
end
