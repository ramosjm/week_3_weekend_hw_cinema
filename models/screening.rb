require_relative('../db/sql_runner')

class Screening

  attr_accessor :film_id, :screening_time
  attr_reader :id

  def initialize(screening)
    @id = screening['id'].to_i if screening['id']
    @film_id = screening['film_id'].to_i
    @screening_time = screening['screening_time']
  end

  def save()
    sql = "INSERT INTO screenings (film_id, screening_time) VALUES ($1 ,$2) RETURNING id"
    values = [@film_id,@screening_time]
    screenings = SqlRunner.run(sql,values).first
    @id = screenings['id'].to_i
  end

end
