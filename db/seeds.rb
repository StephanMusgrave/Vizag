User.create(first_name: 'Ratna', last_name: 'Musgrave',
  email: 'ratna@solindia.com', password: '12345678', has_manager: true)
User.create(first_name: 'Nick', last_name: 'Musgrave',
  email: 'nick@solindia.com', password: '12345678', has_manager: true)
User.create(first_name: 'Customer', last_name: 'Test',
  email: 'customer@test.com', password: '12345678')

AdminUser.create :email => 'admin@solindia.com', :password => '12345678'

