class Jedi
	def prompt
		print "Please enter your answer here: "
	end

	def start()
		puts ""
		puts "***** Welcome to the Jedi mini-Adventure Game *****"
		puts ""
		print "To get started, please tell me your name? "

		@jedi_name = gets.chomp.capitalize

		puts "\nNice to meet you, #{@jedi_name}."
		print "What is your favorite color? "

		@favorite_color = gets.chomp.downcase

		if @favorite_color == 'white'
			puts "\nWow!  My favorite color is white too!!"
		else
			puts "\nExcellent.  My favorite color is white, but #{@favorite_color} is also a nice color."
		end

		start = nil

		while start != 'go'
			puts ""
			puts "When you are ready to get started, type 'GO' and press '<enter>'."
			prompt
			start = gets.chomp.downcase
			if start != 'go'
				puts "\nI'm sorry, I don't understand what you are typing."
			end
		end

		puts "~~~~~~~~"
		puts "You are standing in-front of 3 teleportation doors."
		puts "You remember your mission."
		puts "Your mission is simple: Save mommy!"
		puts "~~~~~~~~"
		puts "A new sith lord named 'Darth Teeth' has arisen and has kidnapped mommy."
		puts "Darth Teeth wishes to battle with you because he believes that you can become a strong Jedi Master who will someday defeat him."
		puts "~~~~~~~~"

		@weapon = nil
		@training_rank = ["Padawan", "Jedi Knight", "Jedi Master"]
		@training_level = 0

		three_doors()
	end

	def leave_room()
			puts ""
			puts "You have now left the room."
			puts "~~~~~~~~"
			three_doors()
	end

	def die()
		puts ""
		puts "Darth Teeth has destroyed you.  Better luck next time."
		Process.exit(0)
	end

	def victory()
		puts ""
		puts "Darth Teeth tries to strike you with his light saber.  You block with your light saber."
		puts ""
		puts "Darth tries to use the force."
		puts "Your training and jedi skills are much better."
		puts "You DEFEAT Darth Teeth"
		puts ""
		puts "Your training and wise selection of your #{@weapon} has saved the universe AND mommy!"
		puts "You give mommy a BIG kiss and hug!"
		puts ""
	  puts "          ____(   \\              .-'    `-.              /   )____"
	  puts "         (____     \\_____       /  (O  O)  \\       _____/     ____)"
	  puts "        (____            `-----(      )     )-----'            ____)"
	  puts "         (____     __________   \\  -____-  /   __________     ____)"
	  puts "           (______/          \\   `-.____.-'   /          \\_____)"
	  puts "                              \\    **HUG**   /"
		Process.exit(0)
	end

	def three_doors()
		puts "THIS IS IMPORTANT: Before you can fight and defeat Darth Teeth, you must finish all your Jedi training with Yoda to become a Jedi Master, AND you must have the right weapon."
		puts ""
		puts "There are 3 doors in-front of you."
		puts "Which door do you want to walk into?"
		
		door_choice = nil

		while door_choice != ('left' || 'middle' || 'right') 
			puts ""
			puts "When you have chosen the door, type 'left' or 'middle' or 'right' and press '<enter>'."
			prompt
			door_choice = gets.chomp.downcase
			if door_choice == 'left'
				left_door()
			elsif door_choice == 'middle'
				middle_door()
			elsif door_choice == 'right'
				right_door()
			else	
				puts "\nI'm sorry, I don't understand what you are typing."
			end
		end
	end

	def left_door()
		puts ""
		puts "You have entered a room with 3 objects laying on the floor:"
		puts "  > A #{@favorite_color}-colored light saber."
		puts "  > A super-powerful laser and rocket blaster."
		puts "  > A watermelon."
		puts ""

		puts "If you want to leave the room, type 'leave' and press <return>."
		puts "OR, you may take an object."
		print "What would you like to do? "

		@weapon = gets.chomp.downcase

		if @weapon.include? "saber"
			@weapon = 'saber'
			puts ""
			puts "********You have picked you the #{@favorite_color}-colored light saber.********"
			leave_room()
		elsif @weapon.include? "blaster"
			weapon = 'blaster'
			puts ""
			puts "********You have picked you the super-powerful laser and rocket blaster.********"
			leave_room()
		elsif @weapon.include? "watermelon"
			weapon = 'watermelon'
			puts ""
			puts "********You have picked you the (REALLY HEAVY) watermelon.********"
			leave_room()
		elsif @weapon.include? "leave"
			leave_room()
		else
			puts ""
			puts "I'm sorry.  That object does not exist in the room.  Let me remind you..."
			left_door()
		end
	end

	def middle_door()
		puts "~~~~~~~~" 
		puts "You walk through the middle door, and see Yoda."

		if @training_level == 2
			puts "Yoda say, 'Complete, your training is.'"
			puts "'Mommy, you must go save.'"
			leave_room()
		else
			puts "Yoda says, 'Train, you must.'"
			puts "'Train now, would you like?'"
			
			puts ""
			puts "You are currently a #{@training_rank[@training_level]}."
			print "Would you like to train? ('yes' OR 'no'): "

			train_now = gets.chomp

			if train_now == 'yes'
				puts "You are training..."
				puts "You are training..."
				puts "You are training..."
				puts "You are training hard..."
				puts "You are training even harder..."
				puts "You are training super duper duper hard..."
				puts "You are training even though you are so tired..."
				puts "..."
				puts "..."
				puts "CONGRATULATIONS!! You have achieved the next level of your training."

				@training_level += 1

				puts "You are now a ******** #{@training_rank[@training_level]}. ********"
				
				leave_room()
			else train_now == 'no'
				leave_room()
			end
		end
	end

	def right_door()
		puts ""
		puts "You walk through the door and see Darth Teeth."
		puts ""
		puts "He smiles at you..."
		puts "You see that he hasn't brushed his teeth for a VERY LONG time.  Gross!"

		puts "Do you want to 'leave' the room or 'battle' Darth Teeth? "
		prompt()

		leave_or_battle = gets.chomp

		if leave_or_battle.include? "leave"
			leave_room()
		elsif leave_or_battle.include? "battle"
			battle(@training_level, @weapon)
		else
			puts ""
			puts "I'm sorry.  That object does not exist in the room.  Let me remind you..."
			right_door()
		end
	end

	def battle(training_level, weapon)
		
		weapon = @weapon

		if training_level < 2
			puts "Darth Teeth says, 'I see you have not completed your training.'"
			puts "Darth Teeth uses the force and destroys you."
			die()
		else
			puts ""
			puts "Darth Teeth says, 'I see you have completed your training, #{@training_rank[training_level]} #{@jedi_name}."
			if weapon == 'saber'
				victory()
			else
				puts "'However, your #{weapon} is no match for my Jedi skills.  FORCE!!!'"
				die()
			end
		end
	end
end

game = Jedi.new()
game.start()