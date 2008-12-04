class Round
  
  attr_reader :competitors, :heats, :status
  
  BEST_HEAT_SIZE = 4
  
  def initialize(competitors)
    @competitors, @heats, @status = competitors, [], :coming_up
    build_heats
  end
  
  def build_heats
    heat = nil
    competitors.each do |competitor|
      heat = Heat.new if heat.nil?
      heat << competitor
      if heat.competitors.length == BEST_HEAT_SIZE or competitor == competitors.last
        heats << heat
        heat = nil
      end
    end
  end
  
  def run_heats
    heats.collect! do |heat|
      next if heat.status != :coming_up
      heat.start
      @current_heat = heat
      heat.finish
    end
  end
  
  def current_heat
    current_heat unless @status != :in_progress
  end
  
  def start
    @status = :in_progress
    run_heats
  end
  
  def finish
    @status = :finished
  end
    
end