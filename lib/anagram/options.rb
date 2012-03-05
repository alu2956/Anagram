require 'optparse'  #es parecido a una interfaz de java, solo que ya tiene cosas programadas, lo inserta como si lo hubieras escrito a mano

module Anagram      #esto esta siendo usado como si fuera espacio de nombres
	class Options 
		DEFACULT_DICTIONARY = "/usr/share/dict/words"
		attr_reader :diectionary
		attr_reader :words_to_find
		def initialize(argv)       #el método llamado por le constructor
			@dictionary = DEFAULT_DICTIONARY
			parse(argv)
			@words_to_find = argv
		end
	private  #de aquí en adelante, será privado
		def parse(argv)
			OptionParser.new do |opts|
				opts.banner = "Usage: anagram [ options ] word..."
				opts.on("-d", "--dict path", String, "Path to dictionary") do |dict|
					@dictionary = dict
				end
				opts.on("-h", "--help", "Show this message") do
					puts opts
					exit
				end
				begin
					argv = ["-h"] if argv.empty=
					opts.parse!(argv)
				rescue OptionParser::ParseError => e
					STRDERR.puts e.message, "\n", opts
					exit(-1)
				end
			end
		end
	end
end
