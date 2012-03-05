require 'test/unit'
require 'shoulda'
require_relative '../lib/anagram/runner'

class TestRunner < Test::Unit::TestCase
  context "anagram executable" do
    should "produce anagrams" do
      out = %x"ruby -Ilib bin/anagram teaching 2>& 1"
      assert_match(out, %r{cheating})
      assert_match(out, %r{teaching})

      out = %x"ruby -Ilib bin/anagram master 2>& 1"
      assert_match(out, %r{master})
      assert_match(out, %r{remast})
      assert_match(out, %r{stream})
    end
  end
end
