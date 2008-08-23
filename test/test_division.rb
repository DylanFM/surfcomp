$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Division'

class TestDivision < Test::Unit::TestCase
  
  def setup
    @name = 'Opens'
    @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll', 'Barton Lynch', 'Kent MacDonald', 'David MacDonald', 'Manoa Drollet', 'Shane Beschen', 'Luke Egan', 'Mark Occilupo', 'Shane Powell', 'Shaun Oldfield', 'Dave Oldfield', 'Ulrich Jaeger', 'Belynda Jaeger']
    @division = Division.new(@name, @competitors)
  end
  
  def test_new_division
    assert_equal(@name, @division.name)
    assert_equal(@competitors, @division.competitors)
    assert_equal(false, @division.heats.empty?)
  end
  
  def test_all_competitors_in_heats
    @active_competitors = []
    @division.heats.each do |heat|
      heat.each { |competitor| @active_competitors << competitor }
    end
    assert_equal(@competitors, @active_competitors)
  end
  
end