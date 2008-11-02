$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require 'test/unit'
require 'Round'
require 'Division'
require 'Heat'
require 'Competitor'

class TestRound < Test::Unit::TestCase
  
  def setup
    competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll', 'Barton Lynch', 'Kent MacDonald', 'David MacDonald', 'Manoa Drollet', 'Shane Beschen', 'Luke Egan', 'Mark Occilupo', 'Shane Powell', 'Shaun Oldfield', 'Dave Oldfield', 'Ulrich Jaeger', 'Belynda Jaeger', 'Adrian Buchan', 'Jughead']
    @division = Division.new('Test', competitors)
    @round = Round.new(@division.competitors)
  end
  
  def test_new_round
    assert_equal('Coming up', @round.status)
    assert_equal(false, @round.heats.empty?)
    assert_equal(@division.competitors, @round.competitors)
  end
  
  def test_all_competitors_in_heats
    @active_competitors = []
    @round.heats.each do |heat|
      heat.competitors.each { |competitor| @active_competitors << competitor }
    end
    assert_equal(@division.competitors, @active_competitors)
  end
  
  def test_heats_are_acceptable_size
    size = 4
    @round.heats.each do |heat|
      assert(heat.competitors.length >= size-1, 'Heat is too small')
      assert(heat.competitors.length <= size+1, 'Heat is too large')
    end
  end
  
  def test_round_run_heats
    @round.run_heats
    @round.heats.each do |heat|
      assert_equal('Finished', heat.status)
    end
  end
  
  def test_round_in
    @round.start
    assert_equal('In progress', @round.status)
  end
  
  def test_round_end
    @round.end
    assert_equal('Finished', @round.status)
  end
  
end