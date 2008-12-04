class Competitor
  
  attr_reader :name, :wave_count
  
  def initialize(name)
    @name, @wave_count = name, 0
  end
  
  def catch_wave
    @wave_count += 1
  end
  
end