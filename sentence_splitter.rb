# Sentence splitter for the Virginia Woolf's _The Waves_. Given a paragraph, returns array of sentences.
# Multiple sentences within parentheses or quotes are kept together, unless parentheses span multiple paragraphs. 
# Allows for ... within a sentence. Does not split on ! or ?


def to_sentences(paragraph)

#---------------- Step 1: Break up paragraph into pieces based on punctuation. 

	old_sentences = paragraph.split(/(?<=\."|\.\)|\.)(?<!\.\s\.|\.\s\."|\.\s\.\))\s(?!\.)|(?<=\.\s\.\s\.\s\."|\.\s\.\s\.\s\.\)|\.\s\.\s\.\s\.)\s/)
										# splits on space in two cases: 1. if preceded by exactly one dot, possibly followed by ) or "
										# 2. if preceded by four dots, possibly followed by ) or " 
										# (exactly one dot before SPLIT no dot after) OR (four dots before SPLIT)

	
#---------------- Step 2: Re-join some pieces so that embedded quotes and parenthetical remarks aren't broken.

 	new_sentences = []
	old_count = 0						# position in old array built in Step 1
	new_count = 0						# position in new array built now in Step 2
		
	while old_count < old_sentences.length
										# each step in outer while loop adds a new element to new_sentences
		skip = 0						# skip keeps track of how many elements of old_sentences are used
		new_sentences[new_count] = old_sentences[old_count]

		while old_count + skip < old_sentences.length and (new_sentences[new_count].count('"')%2 == 1 or new_sentences[new_count].count('(') != new_sentences[new_count].count(')'))
										# each step in inner while loop checks last element of new_sentences for mismatched quotes or parentheses, ...										

			if new_sentences[new_count].count(')') > new_sentences[new_count].count('(')
				old_sentences[old_count] = old_sentences[old_count].sub!(/\)/, "")
				break
			end							# ... if there's a mismatched right parenthesis, deletes it, ...

			if old_count + skip + 1 == old_sentences.length and (new_sentences[new_count].count('(') > new_sentences[new_count].count(')'))
				old_sentences[old_count] = old_sentences[old_count].sub!(/\(/, "")
				skip = -1
				new_count -= 1
				break					# ... if there's a mismatched left parenthesis or quote,
			end							# joins next element of old_sentences to current new_sentence, unless
										# reach end of paragraph with mismatch; then deletes mismatched ( or ',
										# not joining subsequent elements of old_sentences to current new_sentence.
			skip += 1
			new_sentences[new_count] = new_sentences[new_count] + " " + old_sentences[old_count + skip]			
		end

		new_count += 1		
		old_count += skip + 1
	end


#----------------  Step 3: Make sure each piece starts and ends with a single quote.

	sentences_with_quotes = []
	new_sentences.each do |x|
		x = x.chomp
		x = "'"+x if x[0] != "'"
		x = x+"'" if x[x.length-1] != "'"
		sentences_with_quotes << x
	end

	return sentences_with_quotes

end
