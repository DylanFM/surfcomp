Before do
  @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll']
  @competitors.collect! { |c| Competitor.new(c) }
  @judges = ['Peter Pan', 'Tinkerbell', 'Captain Hook']
  @judges.collect! { |j| Judge.new(j) }
  @heat = Heat.new(@competitors, @judges)
end

Given /^a heat is going to be run$/ do
  @heat.should be_instance_of(Heat)
end

When /^the heat is run$/ do
  @heat.start
end

Given /^a heat is run$/ do
  When "the heat is run"
end

Then /^there should be 3 judges for the heat$/ do
  @heat.judges.length.should == 3
  @heat.judges.each do |judge|
    judge.should be_instance_of(Judge)
  end
end

When /^a competitor catches a wave$/ do
  @competitor = @heat.competitors[rand(@heat.competitors.length)]
  @competitor_copy = @competitor.dup
  @heat.competitor_catches_wave(@competitor)
end

Then /^their wave count should increase by 1$/ do
  @competitor.wave_count.should == @competitor_copy.wave_count+1
end

Then /^each judge should give the wave a score out of 10$/ do
  @heat.judges.each do |judge|
    competitor_scores = judge.scores[@competitor.to_s.to_sym]
    competitor_scores.length.should == @competitor.wave_count
    competitor_scores.each do |score|
      score.should be_instance_of(Fixnum)
      score.should be_between(0,10)
    end
  end
end

Then /^each competitor should have no more than 10 scores$/ do
  @heat.competitors.each do |competitor|
    @heat.judges.each do |judge|
      judge.scores[competitor.to_s.to_sym].length.should <= 10
    end
  end
end
