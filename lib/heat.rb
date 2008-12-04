class Heat
  
  attr_reader :competitors, :status, :judges
  attr_accessor :location, :time, :length
  
  def initialize(competitors = [], judges = [])
    @competitors, @judges, @status = competitors, judges, :coming_up
    @judges.collect! do |judge|
      judge.new_heat(@competitors)
    end
  end
  
  def <<(competitor)
    @competitors << competitor
  end
  
  def to_s
    output = "The heat starts at #@time and goes for #@length minutes. It takes place at #@location and consists of the following competitors:"
    @competitors.each { |competitor| output += "\n\t- #{competitor.name}" }
    output
  end
  
  def start
    @status = :in_progress
    self
  end
  
  def competitor_catches_wave(competitor)
    comptetitor = competitors.select { |c| c == competitor }.first
    competitor.catch_wave
    judges.each do |judge|
      judge.score_wave(competitor)
    end
  end
  
  def finish
    @status = :finished
    self
  end
  
end