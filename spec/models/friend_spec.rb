require 'rails_helper'

describe Friend do
  it { should belong_to :admirer }
  it { should validate_presence_of :phone }
  it { should validate_presence_of :name }

  it "doesn't add a new friend if the phone field contains letters" do
    friend = FactoryGirl.build(:friend, phone: "henry")
    expect(friend.save).to eq false
  end
end
