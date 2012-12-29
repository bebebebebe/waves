def speaker(file,x) # returns the speaker's name in paragraph x of file (part of Waves)
	
		if x =~ /said Jinny/
			return 'Jinny'
		elsif x =~ /said Susan/
			return 'Susan'
		elsif x =~ /said Neville/
			return 'Neville'
		elsif x =~ /said Rhoda/
			return 'Rhoda'
		elsif x =~ /said Bernard/
			return 'Bernard'
		elsif x =~ /said Louis/
			return 'Louis'
		else							# If the speaker isn't identified in the paragraph,
			m = -1						# look back to find speaker
			File.readlines(file).each do|i|
				m+=1 
				break if i == x
			end 
		
			j = 1						# keep looking back... some paragraphs may be empty
			while File.readlines(file)[m - j] == "\n" or not (File.readlines(file)[m - j] =~ /said Susan|said Rhoda|said Jinny|said Neville|said Louis|said Bernard/) 
				j = j + 1
			end
		
		
			return speaker(file, File.readlines(file)[m - j])
										# call speaker function on first preceding paragraph
										# that does identify speaker
			
		end
	end