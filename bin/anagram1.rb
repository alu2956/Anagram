#!/usr/bin/env ruby
require 'optparse'

dictionary = "/usr/share/dict/words"
OptionParser.new do |opts|
  opts.banner = "Usage: anagram [ options ] word ..."
  opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
    dictionary = dict
  end
  opts.on("-h", "--help", "Show this message") do
    puts opts
    exit
  end
  begin
    ARGV << '-h' if ARGV.empty?
    opts.parse!(ARGV)
    rescue OptionParser::ParseError => e
      STDERR.puts e.message,"\n",opts
      exit(-1)
  end
end

def signature_of(word)
  word.unpack("c*").sort.pack("c*")
end

signatures = Hash.new { |h,k| h[k] = [] }
File.foreach(dictionary) do |line|
  word = line.chomp
  signature = signature_of(word)
  signatures[signature] << word
end


ARGV.each do |word|
  s = signature_of(word)
  if signatures[s].length != 0
    puts "Anagrams of '#{word}': #{signatures[s].join(', ')}"
  else
    puts "No anagrams of '#{word}' found in #{dictionary}"
  end
end
