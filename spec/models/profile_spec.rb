require 'rails_helper'

RSpec.describe Profile, :type => :model do
  it "is valid with username" do
    profile = Profile.new
    profile.username = 'nateguy@gmail.com'

    profile.save

    expect(profile).to be_valid #check if the item is valid or not
  end

  it "is invalid if no @" do
    profile = Profile.new
    profile.username = 'nateguy'
    profile.save

    expect(profile).to be_invalid
  end
end
