require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Competitor'

Before do
  @name = 'Buttons'
end

After do
end

Given /^the entrant has a name$/ do
  @name.empty?.should == false
end

When /^the entrant becomes a competitor$/ do
  @competitor = Competitor.new(@name)
end

Then /^the entrant should be a competitor$/ do
  @competitor.class.name.should == 'Competitor'
  @competitor.name.should == @name
end