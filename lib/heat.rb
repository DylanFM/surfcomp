class Heat
  
  attr_reader :competitors
  attr_accessor :location, :time, :length
  
  def initialize(competitors = [])
    @competitors = competitors
  end
  
  def add_competitor(competitor)
    @competitors << competitor
  end
  
  def to_s
    output = "The heat starts at #@time and goes for #@length minutes. It takes place at #@location and consists of the following competitors:"
    @competitors.each { |competitor| output += "\n\t- #{competitor.name}" }
    output
  end
  
end