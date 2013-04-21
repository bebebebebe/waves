require './sentence_splitter'
require './waves_speaker'
require './passage_array'
require './give_sentences'

def text(section)
	return 'waves' + section + '.txt'
end

def italics_text(section)
	return 'waves_italics' + section + '.txt'
end

def italics section												# returns two consecutive sentences
	italics = File.readlines(italics_text(section)) - ["\n"]	# in one paragraph of section's italics
	random_paragraph = italics[rand(italics.length)]
	sentences = to_sentences(random_paragraph)
	n = rand(sentences.length - 1)
	puts
	puts 'P A R T  ' + section
	puts
	puts sentences[n][0..-2] + ' ' + sentences[n+1][1..-1]		# removes '' between sentences
	puts
end

def give_instructions
	puts
	puts "Press enter for some of the text. Type 'next' to move to the next section."
	puts
	
end

def reading
	print "> "
	answer = gets.chomp
	if answer == ""
		give_random_sentence
		reading
	elsif answer.downcase == "next"
		navigate
	else give_instructions
		reading
	end
end

def navigate
	section_int = @section.to_i
	if section_int < 9
		@section = (section_int + 1).to_s
		italics @section
		reading
	else puts "T H E   E N D"
	end
end

@section = '1'

give_instructions
italics @section
reading
