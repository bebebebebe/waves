# given file (from _The Waves_), asks user for string and returns info about that string's use in the file. 


	def return_info text
		puts 'Type in a word or phrase to see info about its use:'
		print '> '
		phrase = gets.chomp
		array = make_passage_array(phrase, text)
		speaker_count = {}
		for item in array
			if speaker_count.has_key?(item['speaker'])
				speaker_count[item['speaker']] +=1
			else speaker_count[item['speaker']] = 1
			end
		end
		puts
		if array.length == 1
			puts "There is 1 passage containing '#{phrase}'"
		else puts "There are #{array.length} passages containing `#{phrase}'"
		end
		speaker_list = speaker_count.keys
		for speaker in speaker_list
			if speaker_count[speaker] > 1
				puts "#{speaker} is the speaker in #{speaker_count[speaker]} passages."
			elsif speaker_count[speaker] = 1
				 puts "#{speaker} is the speaker in 1 passage."
			end
		end
	end
