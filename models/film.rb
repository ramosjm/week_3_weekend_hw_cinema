require_relative('../db/sql_runner.rb')

class Film

  attr_accessor :title, :price
  attr_reader :id

  def initialize(film)
    @id = film['id'] if film['id']
    @title = film['title']
    @price = film['price']
  end

end
