require_relative 'messages'

module MastermindSuzan
	class Color
	  include Messages
	  BEGINNER = ["r", "g", "b", "y"]
	  INTERMEDIATE = ["r", "g", "b", "y", "w"]
	  ADVANCED  = ["r", "g", "b", "y", "w", "p"]

	  def set(player)
	    player.gamecolor = case player.level
	    when "b", "beginner" then beginner
	    when "i", "intermediate" then intermediate
	    when "a", "advanced" then advanced
	    end
	  end

	  def beginner
	    puts  beginner_sequence
	    random_sequence = []
	    4.times do |num|
	      random_sequence << BEGINNER.sample
	    end
	    random_sequence
	  end

	  def intermediate
	    puts intermediate_sequence
	    random_sequence = []
	    6.times do |num|
	      random_sequence << INTERMEDIATE.sample
	    end
	    random_sequence
	  end

	  def advanced
	    puts advanced_sequence
	    random_sequence = []
	    8.times do |num|
	      random_sequence << ADVANCED.sample
	    end
	    random_sequence
	  end

	end

end