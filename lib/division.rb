class Division
  
  attr_reader :name, :competitors
  
  def initialize(name, competitors)
    @name = name
    @competitors = competitors.collect! { |c| Competitor.new(c) }
  end
  
end