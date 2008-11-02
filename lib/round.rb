class Round
  
  attr_reader :competitors, :heats
  
  BEST_HEAT_SIZE = 4
  
  def initialize(competitors)
    @competitors, @heats = competitors, []
    build_heats
  end
  
  def build_heats
    heat = Heat.new
    @competitors.each do |competitor|
      heat.add_competitor(competitor)
      if heat.competitors.length == BEST_HEAT_SIZE or competitor == @competitors.last
        @heats << heat
        heat = Heat.new
      end
    end
  end
    
end