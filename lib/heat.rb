class Heat
  
  attr_reader :competitors, :status
  attr_accessor :location, :time, :length
  
  def initialize(competitors = [])
    @competitors, @status = competitors, 'Coming up'
  end
  
  def add_competitor(competitor)
    @competitors << competitor
  end
  
  def to_s
    output = "The heat starts at #@time and goes for #@length minutes. It takes place at #@location and consists of the following competitors:"
    @competitors.each { |competitor| output += "\n\t- #{competitor.name}" }
    output
  end
  
  def start
    @status = 'In progress'
    self
  end
  
  def end
    @status = 'Finished'
    self
  end
  
end