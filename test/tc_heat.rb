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

  def test_new_heat
    assert_equal('Coming up', @heat.status)
    assert_equal(@new_competitors, @heat.competitors)
  end
  
  def test_competitor_is_added
    competitor = Competitor.new('Marshall McLuhan')
    @heat << competitor
    assert_equal(competitor, @heat.competitors.last)
  end

  def test_heat_start
    @heat.start
    assert_equal('In progress', @heat.status)
  end

  def test_heat_finish
    @heat.finish
    assert_equal('Finished', @heat.status)
  end
  
  def test_heat_details_include_all_info
    #Details should include time, location, all competitiors and the heat length
    assert(@heat.to_s =~ Regexp.new(@time), 'Heat details should include time')
    assert(@heat.to_s =~ Regexp.new(@location), 'Heat details should include location')
    assert(@heat.to_s =~ Regexp.new(@length), 'Heat details should include length')
    @new_competitors.each do |c| 
      assert(@heat.to_s =~ Regexp.new(c.name), "Heat details should include competitor: #{c}")
    end
  end
  
end