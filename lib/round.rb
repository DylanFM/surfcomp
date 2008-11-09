class Round
  
  attr_reader :competitors, :heats, :status
  
  BEST_HEAT_SIZE = 4
  
  def initialize(competitors)
    @competitors, @heats, @status = competitors, [], 'Coming up'
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
  
  def run_heats
    @heats.collect! do |heat|
      next if heat.status != 'Coming up'
      heat.start
      @current_heat = heat
      heat.finish
    end
  end
  
  def current_heat
    if @status == 'In progress' then @current_heat else false end
  end
  
  def start
    @status = 'In progress'
    run_heats
  end
  
  def finish
    @status = 'Finished'
  end
    
end