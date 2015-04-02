require 'rails_helper'

describe 'the add a new friend process', js: true do
  it 'adds a new friend to current admirer' do
    admirer = FactoryGirl.build(:admirer)
    sign_in(admirer)
    click_on 'Friends'
    click_on 'New Friend'
    fill_in 'Name', with: 'Example'
    fill_in 'Phone', with: '7085038000'
    click_on 'Add Friend'
    expect(page).to have_content 'Example'
  end
end
