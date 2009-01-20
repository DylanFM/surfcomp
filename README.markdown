#Surfcomp!

##A little ruby program for running a surfing competition.

I'm modelling this off what I know about my local boardrider's competitions (http://avocaboardriders.com) but I'd like it to be able to model the ASP world tour's format too.

*There's a lot to do.*

###A very basic example
It doesn't do much at the moment. Check out the cucumber features and steps to get a better idea on its current state. Also, have a look at the [wiki](http://wiki.github.com/DylanFM/surfcomp "Surfcomp wiki") for some information on surfing competitions.

    #Info on our division
    name = 'Opens'
    competitors = ['Dylan Fogarty-MacDonald', 'Luke Kannar', 'Kelly Slater', 'Matt Graham-Ellison', 'Tom Carroll', 'Barton Lynch', 'Kent MacDonald', 'David MacDonald', 'Manoa Drollet', 'Shane Beschen', 'Luke Egan', 'Mark Occilupo', 'Shane Powell', 'Shaun Oldfield', 'Dave Oldfield', 'Ulrich Jaeger', 'Belynda Jaeger', 'Adrian Buchan', 'Jughead']

    #Make the division
    division = Division.new(name, competitors)

    #First round, opens
    round = Round.new(division.competitors)

    #Start the round
    round.start
    
    #Surfers catch waves, judges judge and so on
    #Some of this is supported, but I'm finding it hard to express here

    #Finish the round
    round.finish
    
    #Competitors move forward to the next round
    #...