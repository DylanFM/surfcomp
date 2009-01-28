class Tabulator
  
  attr_reader :current_heat, :past_heats
  
  def initialize
    @current_heat, @past_heats = {}, []
  end
  
  def receive_scores(judges)
    current_heat = judges.inject(Hash.new) do |heat,judge|
      heat[judge.to_sym] = judge.scores
    end
  end
  
  def reduce_scores
    past_heats << current_heat.dup
    current_heat.each_with_index do |judge,scores|
      current_heat[judge] = scores.sort.slice(1..3)
    end
  end
  
end