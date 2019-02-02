require_relative('../db/sql_runner.rb')


class Ticket

  attr_accessor :customer_id, :film_id
  attr_reader :id

  def initialize(ticket)
    @id = ticket['id'] if ticket['id']
    @customer_id = ticket['customer_id']
    @film_id = ticket['film_id']
  end


end
