class Heat
  
  attr_reader :competitors
  
  def initialize(competitors = [])
    @competitors = competitors
  end
  
  def add_competitor(competitor)
    @competitors << competitor
  end
  
end