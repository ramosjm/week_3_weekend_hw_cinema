require('pry-byebug')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')
require_relative('./models/screening.rb')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


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

film_1 = Film.new({
  'title' => '500 Days of Summer',
  'price' => 5
  })

film_2 = Film.new({
  'title' => 'Transformers',
  'price' => 3
  })

film_3 = Film.new({
  'title' => 'Pirates of the Caribbean',
  'price' => 4
  })

film_1.save
film_2.save
film_3.save

screening_1 = Screening.new({
  'film_id' => film_1.id,
  'screening_time' => '10:00'
  })

screening_2 = Screening.new({
  'film_id' => film_1.id,
  'screening_time' => '13:00'
  })

screening_3 = Screening.new({
  'film_id' => film_1.id,
  'screening_time' => '15:00'
  })



ticket_1 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })

ticket_2 = Ticket.new({
  'customer_id' => customer_2.id,
  'film_id' => film_2.id
  })

ticket_3 = Ticket.new({
  'customer_id' => customer_3.id,
  'film_id' => film_3.id
  })

ticket_4 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })

ticket_5 = Ticket.new({
  'customer_id' => customer_1.id,
  'film_id' => film_1.id
  })

ticket_1.save
ticket_2.save
ticket_3.save
ticket_4.save
ticket_5.save

film_3.title = "Norbit"
film_3.update
customer_2.name = "Dave"
customer_2.update

screening_1.save
screening_2.save
screening_3.save

binding.pry
nil
