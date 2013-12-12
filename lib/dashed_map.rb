module DashedMap
  # Accepts an array of words and returns an array of words, some of them
  # combined by a dash.  
  def dashed_map(words, n=30)
    line_length = 0
    words.inject([]) do |list, word|

      # Get the length of the word
      word_size = word.size
      # Add 1 for the space preceding the word
      # There is no space added before the first word
      word_size += 1 unless list.empty?

      # If adding a word takes us over our limit,
      # join two words by a dash and insert that
      if word_size >= n
        word_pieces = []
        ((word_size / 15) + 1).times do |i|
          word_pieces << word[(i * 15)..(((i+1) * 15)-1)]
        end
        word = word_pieces.compact.select{|p| p.length > 0}.join('-')
        list << word
        line_length = word.size
      elsif (line_length + word_size >= n) and not list.empty?
        previous = list.pop
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

Object.send :include, DashedMap
