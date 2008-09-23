class Division
  
  attr_reader :name, :competitors, :heats
  
  BEST_HEAT_SIZE = 4
  
  def initialize(name, competitors)
    @name, @heats = name, []
    @competitors = competitors.collect! { |c| Competitor.new(c) }
    create_heats
  end
  
  def create_heats
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