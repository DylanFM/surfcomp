class Division
  
  attr_reader :name, :competitors, :heats
  
  BEST_HEAT_SIZE = 4
  
  def initialize(name, competitors)
    @name, @competitors = name, competitors
    create_heats()
  end
  
  def create_heats
    @heats, active = [], []
    # => I want a heat to have 4 competitors, but if we're going to end up with a 1-3 sized heat at the end I want to have a couple of 5 person heats to avoid this.
    heats_count = @competitors.length.quo(BEST_HEAT_SIZE)
    extra_competitors = Integer((heats_count - heats_count.to_i) * BEST_HEAT_SIZE)
    #Start building heats
    heat, extra = [], false
    @competitors.each do |competitor|
      heat << competitor
      active << competitor
      if heat.length == BEST_HEAT_SIZE || extra 
        if extra_competitors == 0 || extra
          @heats << heat
          heat, extra = [], false
        else
          extra_competitors -= 1
          extra = true
        end
      end
    end
  end
  
end