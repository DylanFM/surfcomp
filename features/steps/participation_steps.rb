require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Division'
require 'Competitor'

Before do
  @name = 'Opens'
  @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll', 'Barton Lynch', 'Kent MacDonald', 'David MacDonald', 'Manoa Drollet', 'Shane Beschen', 'Luke Egan', 'Mark Occilupo', 'Shane Powell', 'Shaun Oldfield', 'Dave Oldfield', 'Ulrich Jaeger', 'Belynda Jaeger', 'Adrian Buchan', 'Jughead']
  @new_competitors = @competitors.collect! { |c| Competitor.new(c) }
end

After do
end

Given "there are people who have entered the competition" do
  @competitors.empty?.should == false
end

When "we begin the surf competition" do
  @division = Division.new(@name, @competitors)
end

Then "all entrants should be competing" do
  @division.competitors.should == @new_competitors
end

Then "all entrants should be competitors" do
  @division.competitors.each do |c|
    c.class.name.should == 'Competitor'
  end
end