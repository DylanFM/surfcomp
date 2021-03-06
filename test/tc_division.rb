$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Division'
require 'Competitor'

class TestDivision < Test::Unit::TestCase
  
  def setup
    @name = 'Opens'
    @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll', 'Barton Lynch', 'Kent MacDonald', 'David MacDonald', 'Manoa Drollet', 'Shane Beschen', 'Luke Egan', 'Mark Occilupo', 'Shane Powell', 'Shaun Oldfield', 'Dave Oldfield', 'Ulrich Jaeger', 'Belynda Jaeger', 'Adrian Buchan', 'Jughead']
    @new_competitors = @competitors.collect! { |c| Competitor.new(c) }
    @division = Division.new(@name, @competitors)
  end
  
  def test_new_division
    assert_equal(@name, @division.name)
    assert_equal(@new_competitors, @division.competitors)
  end
  
end