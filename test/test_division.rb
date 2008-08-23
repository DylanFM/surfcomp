$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Division'

class TestDivision < Test::Unit::TestCase
  
  def setup
    @name = 'Opens'
    @competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison']
    @division = Division.new(@name, @competitors)
  end
  
  def test_new_division
    assert_equal(@name, @division.name)
    assert_equal(@competitors, @division.competitors)
  end
  
end