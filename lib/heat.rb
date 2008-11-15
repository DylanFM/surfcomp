class Heat
  
  attr_reader :competitors, :status
  attr_accessor :location, :time, :length
  
  def initialize(competitors = [])
    @competitors, @status = competitors, :coming_up
  end
  
  def <<(competitor)
    @competitors << competitor
  end
  
  def to_s
    output = "The heat starts at #@time and goes for #@length minutes. It takes place at #@location and consists of the following competitors:"
    @competitors.each { |competitor| output += "\n\t- #{competitor.name}" }
    output
  end
  
  def start
    @status = :in_progress
    self
  end
  
  def finish
    @status = :finished
    self
  end
  
end