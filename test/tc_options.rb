require "test/unit"
require "shoulda"

require_relative "../lib/anagram/options"

class TestOptions < Test::Unit::TestCase
  context "Regarding the dictionary:" do
    should "return the default dictionary if no dict is specified" do
      opts = Anagram::Options.new(["someword"])
      assert_equal Anagram::Options::DEFAULT_DICTIONARY, opts.dictionary
    end

    should "return the specified dictionary" do
      opts = Anagram::Options.new(["-d", "mydict", "someword"])
      assert_equal "mydict", opts.dictionary
    end
  end

  context "When specifying words" do
    should "return the words whether you change the dictionary or not" do
      opts = Anagram::Options.new(['-d', 'mydict', 'word1', 'word2'])
      assert_equal %w{word1 word2}, opts.words_to_find

      opts = Anagram::Options.new(['word1', 'word2'])
      assert_equal %w{word1 word2}, opts.words_to_find
    end
  end
end
