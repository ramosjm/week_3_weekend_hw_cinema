require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

customer_1 = Customer.new({
  'name' => 'Lisa',
  'funds' => 622
  })

customer_2 = Customer.new({
  'name' => 'Kevin',
  'funds' => 350
  })

customer_3 = Customer.new({
  'name' => 'Steve',
  'funds' => 800
  })

customer_1.save
customer_2.save
customer_3.save

binding.pry
nil
