require 'rails_helper'


RSpec.describe User, type: :model do
 describe 'new user creating account' do


   #role client users


   it 'with all required attributes(client)' do
     user = User.new(first_name: 'steph', last_name: 'curry', email: 'stephcurry@gmail.com', password: 'password', role: 'client')
     expect(user).to be_valid
   end


   it 'requires first name(client)' do
     user = User.new(last_name: 'curry', email: 'stephcurry@gmail.com', password: 'password', role: 'client')
     expect(user).not_to be_valid
     expect(user.errors[:first_name]).to include("can't be blank")
   end


   it 'requires correct domain(client)' do
     user = User.new(first_name: 'steph', last_name: 'curry', email: 'stephcurry@msu.com', password: 'password', role: 'client')
     expect(user).not_to be_valid
     expect(user.errors[:email]).to include('must be an @gmail.com email address')
   end


   it 'requires a unique email(client)' do
     User.create!(first_name: 'lebron', last_name: 'james', email: 'lebron@gmail.com', password: 'password', role: 'client')
     user = User.new(first_name: 'steph', last_name: 'curry', email: 'lebron@gmail.com', password: 'password', role: 'client')
     expect(user).not_to be_valid
     expect(user.errors[:email]).to include('has already been taken')
   end
 end
end
