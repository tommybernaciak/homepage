AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

StaticContent.create!(body: 'Hi, my name is Tommy.', content_type: 'me')
StaticContent.create!(body: 'Hire me please', content_type: 'work')
