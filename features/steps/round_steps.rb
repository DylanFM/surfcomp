require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Division'
require 'Competitor'
require 'Heat'
require 'Round'

Before do
  competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll', 'Barton Lynch', 'Kent MacDonald', 'David MacDonald', 'Manoa Drollet', 'Shane Beschen', 'Luke Egan', 'Mark Occilupo', 'Shane Powell', 'Shaun Oldfield', 'Dave Oldfield', 'Ulrich Jaeger', 'Belynda Jaeger', 'Adrian Buchan', 'Jughead']
  @division = Division.new('Test', competitors)
end

After do
end

Given "there is a division containing competitors" do
  @division.competitors.should_not be_empty
end

When "a round is created" do
  @round = Round.new(@division.competitors)
end

When "the round has started" do
  @round.start
end

When "the round has finished" do
  @round.finish
end

Then "the round should sort all competitors into heats" do
  @active_competitors = []
  @round.heats.each do |heat|
    heat.competitors.each { |competitor| @active_competitors << competitor }
  end
  @active_competitors.should == @division.competitors
end

Then "the heats should be of an acceptable size" do
  size = 4
  @round.heats.each do |heat|
    heat.competitors.length.should >= size-1
    heat.competitors.length.should <= size+1
  end
end

Then "the round is coming up" do
  @round.status.should == 'Coming up'
end

Then "the round has heats which are coming up" do
  @round.heats.each do |h|
    h.status.should == 'Coming up'
  end
end

Then "there should not be a current heat" do
  @round.current_heat.should == false
end

Then "the round is in progress" do
  @round.status.should == 'In progress'
end

Then "the heats have been run" do
  @round.heats.each do |heat|
    heat.status.should == 'Finished'
  end
end

Then "the round is finished" do
  @round.status.should == 'Finished'
end