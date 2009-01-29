class Judge
  
  attr_reader :name, :scores, :old_scores
  
  def initialize(name)
    @name, @scores, @old_scores = name, {}, []
  end
  
  def new_heat(competitors)
    if scores.empty?
      scores = {}
    else
      old_scores << scores.dup
    end
    competitors.each do |c|
      @scores[c.to_s.to_sym] = []
    end
    self
  end
  
  def score_wave(competitor)
    raise "Competitor not found" unless scores.has_key? competitor.to_s.to_sym
    scores[competitor.to_s.to_sym] << rand(10).to_i
  end
  
end