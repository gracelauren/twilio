require 'rails_helper'

describe 'the send a message process', js: true, vcr: true do
  it 'lets admirer send message to friend' do
    admirer = FactoryGirl.create(:admirer)
    sign_in(admirer)
    click_on 'Messages'
    click_on 'Want to send a text?'
    fill_in 'To', with: '7085038000'
    fill_in 'Body', with: 'Hello Friend!'
    click_on 'Send your text!'
    expect(page).to have_content 'Hello'
  end
end
