require_relative('../db/sql_runner.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(customer)
    @id = customer['id'].to_i if customer['id']
    @name = customer['name']
    @funds = customer['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUEs ($1,$2) RETURNING id"
    values = [@name,@funds]
    customer = SqlRunner.run(sql,values).first
    @id = customer['id'].to_i
  end

end
