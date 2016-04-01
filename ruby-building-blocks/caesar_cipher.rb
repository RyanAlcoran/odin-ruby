def caesar_cipher(text, factor)
  cipher = ""
  text.each_char {|c|
    if(c.match(/[[:alpha:]]/) != nil)
      ch = c.ord + factor
      if(c.match(/[[:upper:]]/) != nil)
        if(ch > 90)
          diff = ch - 90
          ch = 64 + diff
          cipher += ch.chr
        else
          cipher += ch.chr
        end
      else
        if(ch > 122)
          diff = ch - 122
          ch = 96 + diff
          cipher += ch.chr
        else
          cipher += ch.chr
        end
      end
    else
      cipher += c
    end
  }
  puts cipher
end

caesar_cipher("What a string!", 5)