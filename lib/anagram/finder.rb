module Anagram
  class Finder
    attr_accessor :signatures

    def self.from_file(name)
      new(File.new(name).readlines.map &:chomp)
    end

    def initialize(words)
      @signatures = {}
      words.each do |w|
        s = Finder.signature_of(w) 
        (@signatures[s] ||= []) << w
      end
    end

    def self.signature_of(word)
      word.unpack("c*").sort.pack("c*")
    end

    def lookup(word)
      @signatures[Finder.signature_of(word)]
    end

  end

end
