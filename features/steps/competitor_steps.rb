require 'spec'
$:.unshift(File.dirname(__FILE__) + '/../../lib')

require 'Competitor'

Before do
  @name = 'Buttons'
end

After do
end

Given "the person has a name" do
  @name.empty?.should == false
end

When "the competitor is created" do
  @competitor = Competitor.new(@name)
end

Then "the competitor should be a competitor" do
  @competitor.class.name.should == 'Competitor'
end

Then "the competitor should be the person" do
  @competitor.name.should == @name
end