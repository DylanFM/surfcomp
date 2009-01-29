$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'pp'

require 'Competitor'
require 'Heat'
require 'Judge'

@competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll']
@competitors.collect! { |c| Competitor.new(c) }

@judges = ['Peter Pan', 'Tinkerbell', 'Captain Hook']
@judges.collect! { |j| Judge.new(j) }

@heat = Heat.new(@competitors, @judges)

@heat.start

35.times do
  competitor = @heat.competitors[rand(@heat.competitors.length)]
  @heat.competitor_catches_wave(competitor)
end

pp @heat
# >> #<Heat:0x8cadc
# >>  @competitors=
# >>   [#<Competitor:0x8cbe0 @name="Dylan Fogarty-MacDonald", @wave_count=6>,
# >>    #<Competitor:0x8cbcc @name="Luke Kannar", @wave_count=9>,
# >>    #<Competitor:0x8cba4 @name="Kelly Slater", @wave_count=6>,
# >>    #<Competitor:0x8cb7c @name="Matt Graham-Ellison", @wave_count=7>,
# >>    #<Competitor:0x8cb54 @name="Tom Carroll", @wave_count=7>],
# >>  @judges=
# >>   [#<Judge:0x8cac8
# >>     @name="Peter Pan",
# >>     @old_scores=[],
# >>     @scores=
# >>      {:"#<Competitor:0x8cb54>"=>[1, 7, 2, 7, 5, 7, 6],
# >>       :"#<Competitor:0x8cbe0>"=>[9, 2, 5, 3, 8, 9],
# >>       :"#<Competitor:0x8cbcc>"=>[1, 4, 2, 7, 4, 1, 3, 5, 0],
# >>       :"#<Competitor:0x8cba4>"=>[6, 8, 7, 4, 4, 5],
# >>       :"#<Competitor:0x8cb7c>"=>[6, 3, 5, 5, 3, 2, 6]}>,
# >>    #<Judge:0x8cab4
# >>     @name="Tinkerbell",
# >>     @old_scores=[],
# >>     @scores=
# >>      {:"#<Competitor:0x8cb54>"=>[1, 9, 8, 8, 7, 7, 0],
# >>       :"#<Competitor:0x8cbe0>"=>[6, 7, 4, 0, 9, 6],
# >>       :"#<Competitor:0x8cbcc>"=>[3, 3, 7, 2, 1, 9, 5, 9, 1],
# >>       :"#<Competitor:0x8cba4>"=>[4, 1, 2, 6, 0, 9],
# >>       :"#<Competitor:0x8cb7c>"=>[9, 7, 2, 1, 6, 7, 0]}>,
# >>    #<Judge:0x8ca64
# >>     @name="Captain Hook",
# >>     @old_scores=[],
# >>     @scores=
# >>      {:"#<Competitor:0x8cb54>"=>[5, 6, 4, 9, 9, 3, 3],
# >>       :"#<Competitor:0x8cbe0>"=>[8, 6, 2, 3, 4, 7],
# >>       :"#<Competitor:0x8cbcc>"=>[7, 3, 1, 8, 5, 4, 5, 4, 5],
# >>       :"#<Competitor:0x8cba4>"=>[6, 5, 1, 1, 9, 8],
# >>       :"#<Competitor:0x8cb7c>"=>[6, 1, 5, 9, 2, 4, 0]}>],
# >>  @status=:in_progress>
