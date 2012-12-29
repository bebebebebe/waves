require './waves_speaker'
require './passage_array'
require './return_passages'
require './return_info'



	def give_instructions
		puts "--------------------------------"
		puts "Current part of text: #{@section}"
		puts "* Do you want to see information or passages concerning a given word?"
		puts ""
		puts "Type 'info' or 'passages', or type 'bye' to exit, or type 'section' to look at another section (or the entire novel)."
		puts ""
		puts "....you can always ask for instructions if you want them again..."
		puts "--------------------------------"
		get_request
	end

	def get_request
		print "type info/passages/section/bye > "
		answer = gets.chomp
		if answer == 'info'
			return_info text(@section)
			get_request
		elsif answer == 'passages'
			return_passages	text(@section)
			get_request
		elsif answer == 'section'
			navigate		
		elsif answer == 'bye'
			puts 'Goodbye!'
			Process.exit(1)
		else give_instructions
		end
	end
	
	def navigate
		puts 'What section do you want to look at? Type "all," or the section number (1 - 9)'
		print "> "
		answer = gets.chomp
		if answer == '1' or answer == '2' or answer == '3' or answer == '4' or answer == '5' or answer == '6' or answer == '7' or answer == '8' or answer == '9' or answer == 'all'
			@section = answer
		else
			puts 'Make sure you type a section number or "all"!'
			navigate
		end
		give_instructions
	end
	
	def text(section)
		if section == 'all'
			return 'waves_all.txt'
		else return 'waves' + section + '.txt'
		end
	end
		


@section = "1"
give_instructions



