class Heat
  
  attr_reader :name, :competitors
  
  def initialize(competitors = [])
    @competitors = competitors
  end
  
  def add_competitor(competitor)
    @competitors << competitor
  end
  
end