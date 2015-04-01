require 'rails_helper'

describe Message do
  it "doesn't save the message if twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5005550006')
    message.save.should be false
  end
end
