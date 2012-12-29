Interacting with Virginia Woolf's novel _The Waves_.
========

Two programs:

* waves_cut_up.rb 

	Interactive cut-up (http://en.wikipedia.org/wiki/Cut-up_technique) of The Waves.
	
	The novel consists of nine sections, each with a "prelude." The user starts in section
	one, and moves to a subsequent section when s/he choses. At the start of each section, two randomly
	chosen consecutive sentences from the section's prelude are presented;  after that, each time
	the user presses enter, a randomly chosen sentence from the section is presented with
	the speaker of the sentence identified.
	
	Sub-programs: sentence_splitter.rb, waves_speaker.rb, passage_array.rb, give_sentences.rb

* waves_analyze.rb 

	Returns paragraphs from the text containing a given word chosen by the user, with the 
	chosen word in block capitals, and the speaker identified.

	Returns information about a word's use (how much does each character use the word?).

	The user can choose one of the novel's nine sections, or look at the entire novel.
	
	Sub-programs: waves_speaker.rb, passage_array.rb, return_passages.rb, return_info.rb
	
----------

The .txt files are parts of the text of the novel, obtained from 
Project Gutenberg http://gutenberg.net.au/ebooks02/0201091.txt