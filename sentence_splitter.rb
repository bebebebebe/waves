# Sentence splitter for the Virginia Woolf's _The Waves_. Given a paragraph, returns array of sentences.
# Multiple sentences within parentheses or quotes are kept together, unless parentheses span multiple paragraphs. 
# Allows for ... within a sentence. Does not split on ! or ?


def to_sentences(paragraph)
	old_sentences = paragraph.split(/(?<=\."|\.\)|\.)(?<!\.\s\.|\.\s\."|\.\s\.\))\s(?!\.)|(?<=\.\s\.\s\.\s\."|\.\s\.\s\.\s\.\)|\.\s\.\s\.\s\.)\s/)
								# (---exactly one dot before-----split-no dot after----) OR (-four dots before ---------------------------- split)
										# splits on space in two cases: 1. if preceded by exactly one dot, possibly followed by ) or "
										# 2. if preceded by four dots, possibly followed by ) or " 
	
 	new_sentences = []
	old_count = 0
	new_count = 0
	
	
	while old_count < old_sentences.length				# joins some sentences in split so quotes and parentheses aren't broken
		skip = 0
		new_sentences[new_count] = old_sentences[old_count]
		while old_count + skip < old_sentences.length and (new_sentences[new_count].count('"')%2 == 1 or new_sentences[new_count].count('(') != new_sentences[new_count].count(')'))
			if new_sentences[new_count].count(')') > new_sentences[new_count].count('(')
				old_sentences[old_count] = old_sentences[old_count].sub!(/\)/, "")
				break
			end


			if old_count + skip + 1 == old_sentences.length and (new_sentences[new_count].count('(') > new_sentences[new_count].count(')'))
				old_sentences[old_count] = old_sentences[old_count].sub!(/\(/, "")
				skip = -1
				new_count -= 1
				break
			end

			skip += 1
			new_sentences[new_count] = new_sentences[new_count] + " " + old_sentences[old_count + skip]			
		end

		new_count += 1		
		old_count += skip + 1
	end



	sentences_with_quotes = []
	new_sentences.each do |x|		# makes sure the sentences start and end with '
		x = x.chomp
		x = "'"+x if x[0] != "'"
		x = x+"'" if x[x.length-1] != "'"
		sentences_with_quotes << x
	end
	return sentences_with_quotes

end
