def substrings(input, dictionary)
  text = input.gsub(/[[:punct:]]/, "")
  words = text.downcase.split
  frequencies = Hash.new(0)
  words.each { |word|
    i = 0
    while i < word.size
      k = i
      while k < word.size
        substring = word[i..k]
        if dictionary.include?(substring)
          frequencies[substring] += 1
        end
        k += 1
      end
      i += 1
    end
  }
  puts frequencies
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)