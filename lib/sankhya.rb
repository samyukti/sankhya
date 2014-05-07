require 'sankhya/version'
require 'sankhya/words'
require 'sankhya/numbers'

module Sankhya
  def to_words(options = {})
    Numbers.translate self, options
  end

  def to_amount(options = {})
    Numbers.amount self, options
  end
end

Integer.send :include, Sankhya
Float.send :include, Sankhya
