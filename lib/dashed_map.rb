module DashedMap
  # Accepts an array of words and returns an array of words, some of them
  # combined by a dash.  
  def dashed_map(words, n=30)
    # We need to make sure this is zero initially
    line_length = 0
    words.inject([]) do |list, word|

      # Get the length of the word
      word_size = word.size
      # Add 1 for the space preceding the word
      # There is no space added before the first word
      word_size += 1 unless list.empty?

      # If the word itself exceeds the limit, sprinkle it with dashes
      if word_size >= n
        word_pieces = []
        # I thought about doing a String#gsub to put a dash after
        # every 15th character, but decided this would be a little
        # easier to follow
        ((word_size / 15) + 1).times do |i|
          word_pieces << word[(i * 15)..(((i+1) * 15)-1)]
        end
        # It's important to code defensively
        word = word_pieces.compact.select{|p| p.length > 0}.join('-')
        # Append the word to the list array
        list << word
        line_length = word.size
      # If adding a word takes us over our limit,
      # join two words by a dash and insert that
      elsif (line_length + word_size >= n) and not list.empty?
        # Remove the most recently added word from the non-empty list
        previous = list.pop
        # Make sure it's a string in case it somehow got turned into nil
        previous ||= ''
        list << previous + '-' + word
        line_length = word_size
      # Otherwise just add the word to the list
      else
        list << word
        line_length += word_size
      end

      # Return the list so that inject works
      list
    end
  end
end

# Include dashed_map in every object so it can be easily be used wherever
# it's needed
Object.send :include, DashedMap
