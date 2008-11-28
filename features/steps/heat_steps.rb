require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Competitor'
require 'Heat'

Before do
  @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll']
  @new_competitors = @competitors.collect! { |c| Competitor.new(c) }
  @time = '10:30am'
  @location = 'North bank'
  @length = '25'
end

After do
end

Given /^there are competitors for a heat$/ do
  @competitors.should_not be_empty
end

When /^the heat is made$/ do
  @heat = Heat.new(@competitors)
  @heat.time = @time
  @heat.location = @location
  @heat.length = @length
end

Then /^the heat should contain the competitors$/ do
  @heat.competitors.should == @new_competitors
end

Then /^the heat should be coming up$/ do
  @heat.status.should == :coming_up
end

Given /^there is a competitor and a heat$/ do
  When 'the heat is made'
  @competitor = Competitor.new('Marshall McLuhan')
end

When /^a competitor is added to the heat$/ do
  @heat << @competitor
end

Then /^the competitor should be in the heat$/ do
  @heat.competitors.last.should == @competitor
end

Given /^there is a new heat$/ do
  When 'the heat is made'
end

When /^the heat is started$/ do
  @heat.start
end

Then /^the heat should be in progress$/ do
  @heat.status.should == :in_progress
end

Given /^there is a heat in progress$/ do
  When 'the heat is made'
  When 'the heat is started'
end

When /^the heat finishes$/ do
  @heat.finish
end

Then /^the heat should be finished$/ do
  @heat.status.should == :finished
end

Given /^there is a heat$/ do
  When 'the heat is made'
end

When /^the heat details are requested$/ do
  @details = @heat.to_s
end

Then /^the details should show the time$/ do
  @details.should =~ Regexp.new(@time)
end

Then /^they should show the length$/ do
  @details.should =~ Regexp.new(@length)
end

Then /^they should show the location$/ do
  @details.should =~ Regexp.new(@location)
end

Then /^they should show the competitors$/ do
  @new_competitors.each do |c| 
    @details.should =~ Regexp.new(c.name)
  end
end
