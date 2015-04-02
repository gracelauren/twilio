require 'rails_helper'

describe 'the sign up process' do
  it 'signs up a new admirer' do
    visit root_path
    click_on 'Sign Up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'successfully'
  end
end

describe 'the sign in/out process' do
  it 'logs an admirer in' do
    admirer = FactoryGirl.create(:admirer)
    visit root_path
    click_on 'Log In'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'
    expect(page).to have_content 'successfully'
  end

  it 'logs an admirer out' do
    admirer = FactoryGirl.create(:admirer)
    sign_in(admirer)
    click_on 'Log Out'
    expect(page).to have_content 'out'
  end
end
