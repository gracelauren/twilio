require 'rails_helper'

describe Message do
  it { should belong_to :admirer }

  it "doesn't save the message if the to field contains letters" do
    message = FactoryGirl.build(:message, to: "henry")
    expect(message.save).to eq false
  end
end

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives an error" do
    message = FactoryGirl.build(:message, to: '1111111')
    message.save.should be false
  end

  it 'adds an error if the from number is invalid' do
    message = FactoryGirl.build(:message, from: '1111111')
    message.save
    message.errors.messages[:base].should eq ["The From phone number 1111111 is not a valid, SMS-capable inbound phone number or short code for your account."]
  end

  it 'adds an error message if the from number is correct but the queue is full' do
    message = FactoryGirl.build(:message, :from => '+15005550008')
    message.save
    message.errors.messages[:base].should eq ["SMS queue is full."]
  end

  it 'adds an error if the to number is invalid' do
    message = FactoryGirl.build(:message, :to => '1111111')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end

  it 'adds an error if the to number cannot accept SMS messages' do
    message = FactoryGirl.build(:message, :to => '15005550009')
    message.save
    message.errors.messages[:base].should eq ["To number: 15005550009, is not a mobile number"]
  end

  it 'adds an error message if the to number is an international number' do
    message = FactoryGirl.build(:message, :to => '+15005550003')
    message.save
    message.errors.messages[:base].should eq ["Permission to send an SMS has not been enabled for the region indicated by the 'To' number: +15005550003."]
  end

  it 'adds an error message if the to number is blacklisted for the account' do
    message = FactoryGirl.build(:message, :to => '+15005550004')
    message.save
    message.errors.messages[:base].should eq ["The message From/To pair violates a blacklist rule."]
  end

  it 'saves a message if the from and to numbers are correct' do
    message = FactoryGirl.build(:message)
    message.save
    message[:body].should eq "Hello World!"
  end

  it 'saves a message if the from and to numbers are correct' do
    message = FactoryGirl.build(:message, :to => '(708)503-8000')
    message.save
    message[:body].should eq "Hello World!"
  end

  it 'saves a message if the from and to numbers are correct' do
    message = FactoryGirl.build(:message, :to => '708.503.8000')
    message.save
    message[:body].should eq "Hello World!"
  end
end
