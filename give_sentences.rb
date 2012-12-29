# returns random sentence in current section, indicating speaker

	def give_random_sentence
		file = text(@section)
		all_passages = make_passage_array('',file)
		random_passage = all_passages[rand(all_passages.length)]
		speaker = random_passage['speaker']
		paragraph = to_sentences(random_passage['paragraph'])
		sentence = paragraph[rand(paragraph.length)]
		puts
		puts speaker.upcase + ':'
		print '       '
		print sentence
		puts
		puts
		puts
	end
	