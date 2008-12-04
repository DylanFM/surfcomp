class Judge
  
  attr_reader :name, :scores
  
  def initialize(name)
    @name, @scores = name, {}
  end
  
  def new_heat(competitors)
    competitors.each do |c|
      scores[c.object_id.to_sym] = []
    end
    self
  end
  
  def score_wave(competitor)
    scores[competitor.object_id.to_sym] << rand(10).to_i
  end
  
end