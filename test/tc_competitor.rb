$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Competitor'

class TestCompetitor < Test::Unit::TestCase
  
  def setup
    @name = 'Buttons'
    @competitor = Competitor.new(@name)
  end
  
  def test_competitor_is_correct
    assert_equal(@name, @competitor.name)
  end
  
end