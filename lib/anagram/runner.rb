module Anagram
  require_relative "finder"
  require_relative "options"

  class Runner
    def initialize(argv)
      @options = Options.new(argv)
    end

    def run
      f = Finder.from_file(@options.dictionary)
      @options.words_to_find.each do |w|
        anagrams = f.lookup(w)
        if anagrams 
          puts "Anagrams of #{w}: #{anagrams.join(', ')}"
        else
          puts "No anagrams of #{w} found in #{@options.dictionary}"
        end
      end
    end
  end
end
