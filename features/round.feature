Feature: Round has competitors in heats
	In order to run heats with competitors
	A round should be created with heats of competitors

	Scenario: Make a new round
		Given there is a division containing competitors
		When a round is created
		Then the round should sort all competitors into heats
		And the heats should be of an acceptable size