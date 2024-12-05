require 'rails_helper'
RSpec.describe 'New user Signup', type: :system do
 describe 'Signup' do
   context 'Happy Path' do
     it 'allows a user to sign up as a client' do
       visit new_user_registration_path


       within('form') do
         fill_in 'First name', with: 'Amanuel'
         fill_in 'Last name', with: 'Samuel'
         fill_in 'Email', with: 'amanuelsamuel@gmail.com'
         fill_in 'Password', with: 'password'
         fill_in 'Password confirmation', with: 'password'
         select 'Client', from: 'Role' # Select the 'Client' role from the dropdown
         click_button 'Sign up' # This now scopes to the form only
       end


       expect(page).to have_content('Welcome! You have signed up successfully.')
     end
   end


   context 'Sad Path' do
     it 'gives error when sign up with missing details' do
       visit new_user_registration_path
        within('form') do
         fill_in 'First name', with: ''
         fill_in 'Last name', with: ''
         fill_in 'Email', with: ''
         fill_in 'Password', with: 'password'
         click_button 'Sign up'
       end
       expect(page).to have_content('There were errors with your submission. Please fill in all required fields.')
     end
   end
 end
  describe 'User Login '
   context 'Happy Path' do
     let!(:user) { User.create!(first_name: 'amanuel', last_name: 'samuel', email: 'amanuel@gmail.com', password: 'password', role: 'client') }


     it 'allows a user to log in with correct credentials' do
       visit new_user_session_path


       within('form') do
         fill_in 'Email', with: user.email
         fill_in 'Password', with: 'password'
         click_button 'Log in'
       end


       expect(page).to have_content('Signed in successfully.')
     end
   context 'Sad Path' do
     it 'prevents login with incorrect credentials' do
       visit new_user_session_path


       within('form') do
         fill_in 'Email', with: 'wrong.email@gmail.com'
         fill_in 'Password', with: 'wrongpassword'
         click_button 'Log in'
       end


       expect(page).to have_content('Invalid Email or password.')
     end
   end
 end
end
