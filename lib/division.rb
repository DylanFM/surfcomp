class Division
  
  attr_reader :name, :competitors, :heats
  
  def initialize(name, competitors)
    @name = name
    @competitors = competitors
    create_heats()
  end
  
  def create_heats
    #Heats contain 3-5 competitors, preferably 4
    @heats = []
    @heat = []
    @active_competitors = []
    @competitors.each do |competitor|
      @active_competitors << competitor
      @heat << competitor
      if @heat.length == 4 || @competitors.length - @active_competitors.length < 4
        @heats << @heat
        @heat = []
      end
    end
  end
  
end