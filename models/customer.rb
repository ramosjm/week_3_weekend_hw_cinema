require_relative('../db/sql_runner.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(customer)
    @id = customer['id'].to_i if customer['id']
    @name = customer['name']
    @funds = customer['funds'].to_i
  end

  # def reduce_funds(film)
  #   @funds -= film.price
  #   p customer.funds
  # end

  def ticket_count()
    sql = "SELECT tickets.* FROM tickets INNER JOIN customers ON tickets.customer_id = customers.id WHERE tickets.customer_id = $1"
    values = [@id]
    tickets = SqlRunner.run(sql,values)
    return tickets.count
  end

  def films() #All films for a customer
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql,values)
    return films.map{|film|Film.new(film)}
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1,$2) RETURNING id"
    values = [@name,@funds]
    customer = SqlRunner.run(sql,values).first
    @id = customer['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1,$2) WHERE id =$3"
    values = [@name,@funds,@id]
    SqlRunner.run(sql,values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql,values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return customers.map{|customer|Customer.new(customer)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

end
