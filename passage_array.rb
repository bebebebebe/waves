# given a string and a file (part of _The Waves_), returns hash with speaker and paragraph containing that string from that file

def make_passage_array(word, file)
		passage_array = []
		reg_exp = Regexp.new word
		n=0
		File.readlines(file).each do |paragraph|
			if paragraph =~ reg_exp and paragraph != "\n" and paragraph != " \n"
				current_speaker = speaker(file,paragraph)
				passage_array[n] = {'speaker' => current_speaker, 'paragraph' => paragraph}
				n+=1
			end
		end
		return passage_array
	end
