def sign_up(email: "test@example.com", password: "123456", password_confirmation: "123456")
  visit('/')
  click_link('Sign up')
  fill_in('user_email', with: email)
  fill_in('user_password', with: password)
  fill_in('user_password_confirmation', with: password_confirmation)
  click_button('Sign up')
end

def sign_in
end
