require "sankhya/version"
require "sankhya/words"
require "sankhya/numbers"

module Sankhya
  def to_words(options = {})
    Numbers::translate self, nil #, options[:scale]
  end
end

Integer.send :include, Sankhya
Float.send :include, Sankhya
