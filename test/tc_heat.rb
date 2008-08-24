$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Heat'

class TestHeat < Test::Unit::TestCase
  
  def setup
    @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll']
    @heat = Heat.new
  end
  
  def test_competitors_are_absent
    assert(@heat.competitors.empty?, 'Heat should not have competitors')
  end
  
  def test_competitor_is_added
    competitor = @competitors.pop
    @heat.add_competitor(competitor)
    assert_equal(competitor, @heat.competitors.last)
  end
  
  def test_competitors_added_at_init
    @heat = Heat.new(@competitors)
    assert_equal(@competitors, @heat.competitors)
  end
  
end