require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Tabulator'

Before do
  @tabulator = Tabulator.new
end

Given %r|a heat has finished| do
  When 'the heat is made'
  When 'the heat is started'
  #Simulate competitors catching waves in a heat
  35.times do
    competitor = @heat.competitors[rand(@heat.competitors.length)]
    @heat.competitor_catches_wave(competitor)
  end
  When 'the heat finishes'
end

When %r|the heat's judges submit their scores| do
  @tabulator.receive_scores(@heat.judges)
end

Then %r|the scores are reduced to the top 3 per competitor| do
  @tabulator.reduce_scores
  @tabulator.current_heat.each_value do |competitor_scores|
    competitor_scores.length.should_not_be > 3
  end
end

Given %r|the scores are ready for totaling| do
  When 'a heat has finished'
  When "the heat's judges submit their scores"
  When 'the scores are reduced to the top 3 per competitor'
end

When %r|each judge's scores are totaled per competitor| do
end

Then %r|the judges' heat places are calculated| do
end

When %r|each competitor's places per judge are totaled| do
end

Then %r|the ranks of the competitors can be found| do
end

Then %r|the ranks of the competitors are from lowest total to the highest| do
end