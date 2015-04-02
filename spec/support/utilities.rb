def sign_in(admirer)
  visit root_path
  click_on 'Log In'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '12345678'
  click_on 'Log in'
end
