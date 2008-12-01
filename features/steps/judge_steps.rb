require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Competitor'
require 'Heat'

Before do
  @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll']
  @heat = Heat.new(@competitors)
end

Given /^a heat is going to be run$/ do
  @heat.class.should == Heat
end

When /^the heat is run$/ do
  @heat.start
end

Then /^there should be 3 judges for the heat$/ do
  @heat.judges.length.should == 3
  @heat.judges.each do |judge|
    judge.class.should == Judge
  end
end

When /^a competitor catches a wave$/ do
  @competitor = @heat.competitors[rand(@heat.competitors.length)]
  @competitor_copy = @competitor.dup
  @competitor.catch_wave
end

Then /^the competitors wave count should increase by 1$/ do
  @competitor.wave_count.should == @competitor_copy.wave_count+1
end

Then /^each judge should submit a score for that wave$/ do
  @heat.judges.each do |judge|
    judge.scores[@competitor.to_s.to_sym].length.should == @competitor.wave_count.length
  end
end

Then /^each competitor should have the same amount of scores$/ do
  @heat.competitors.each do |competitor|
    @heat.judges.each do |judge|
      judge.scores[competitor.to_s.to_sym].length.should == competitor.wave_count.length
    end
  end
end