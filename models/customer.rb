require_relative('../db/sql_runner.rb')

class Customer

  attr_accessor :name, :funds
  attr_reader :id

  def initialize(customer)
    @id = customer['id'] if customer['id']
    @name = customer['name']
    @funds = customer['funds']
  end

end
