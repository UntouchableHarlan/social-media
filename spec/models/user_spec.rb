require 'rails_helper'

RSpec.describe User, type: :model do
  it "should have many friendships" do
    should have_many(:user_friendships)
    should have_many(:friends)
  end

  it "should not throw error when trying to get user friends" do
    @u = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password)

    @w = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password)

    @w.friends
  end



  it "should still create friends" do
    @u = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password)

    @w = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password)

    @u.friends << @w
    @u.friends.reload
    @u.friends.include?(@w)
  end

  it "should create friends based on user id and friend id" do
    @u = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password)

    @w = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: Faker::Internet.password)

    UserFriendship.create(user_id: User.find(1), friend_id: User.find(2))
    User.find(1).friends.include?(User.find(2))
  end


end
