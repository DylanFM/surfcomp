$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Heat'
require 'Competitor'

class TestHeat < Test::Unit::TestCase
  
  def setup
    #Heat info
    @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll']
    @new_competitors = @competitors.collect! { |c| Competitor.new(c) }
    @time = '10:30am'
    @location = 'North bank'
    @length = '25'
    #Make heat
    @heat = Heat.new(@competitors)
    @heat.time = @time
    @heat.location = @location
    @heat.length = @length
  end

  def test_competitors_added_at_init
    assert_equal(@new_competitors, @heat.competitors)
  end
  
  def test_competitor_is_added
    competitor = Competitor.new('Marshall McLuhan')
    @heat.add_competitor(competitor)
    assert_equal(competitor, @heat.competitors.last)
  end
  
  def test_heat_details_include_all_info
    #Details should include time, location, all competitiors and the heat length
    assert(@heat.details =~ Regexp.new(@time), 'Heat details should include time')
    assert(@heat.details =~ Regexp.new(@location), 'Heat details should include location')
    assert(@heat.details =~ Regexp.new(@length), 'Heat details should include length')
    @new_competitors.each { |c| 
      assert(@heat.details =~ Regexp.new(c.name), "Heat details should include competitor: #{c}")
    }
  end
  
end