# given a file (part of _The Waves_), requests a string and returns all paragraphs in file containing the string in upper case, 
# indicating speaker. says how many passages there are with that string.


def return_passages section
		puts 'Type in a word or phrase to see passages containing it.'
		print '> '
		phrase = gets.chomp
		reg_exp = Regexp.new phrase
		array = make_passage_array(phrase, section)
		for item in array
			puts item['speaker'] + ' is speaking in this paragraph containing ' + phrase + ':'
			puts
			puts item['paragraph'].gsub(reg_exp, phrase.upcase)
			puts
			puts '********'
			puts
		end
		puts
		puts "Total of #{array.length} passages containing '#{phrase}.'" 
		if array.length > 0
			puts "Find '#{phrase}' in UPPER CASE in passages above."
		end
	end
	
