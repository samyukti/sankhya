module Sankhya
  class Numbers
    extend Words

    def self.translate(number, options)
      parse options

      if number.integer?
        words_of(number)
      else # if float
        integer = number.floor
        decimal = (number * (10**@scale)).floor - (integer * (10**@scale))
        [words_of(integer), words_of(decimal)]
      end
    end

    def self.amount(number, options)
      parse options

      numbers = format "%.#{@scale}f", number
      integers, decimals = numbers.split('.')

      result = []
      result << integers.reverse[3..-1].to_s.gsub(/(\d{2})(?=\d)/, '\\1,').reverse
      result << integers.reverse[0..2].reverse

      result.select { |x| !x.empty? }.join(',') + '.' + decimals
    end

    class << self
      private

      def number?(number)
        true if Float(number) rescue false
      end

      def parse(options)
        @comma = options.key?(:comma) ? options[:comma] : true
        @scale = number?(options[:scale]) ? ([options[:scale], 0].max) : 2
      end

      def words_of(number)
        if number < 20
          to_english(number)
        else
          words = []

          units = [{ divisor: 100, prefix: ', and' },
                   { divisor: 10,  suffix: 'hundred,' },
                   { divisor: 100, suffix: 'thousand,' },
                   { divisor: 100, suffix: 'lakh,' }]

          i = 0
          while i < units.length
            number, segment = number.divmod(units[i][:divisor])
            parts = segment < 20 ? segment.divmod(100) : segment.divmod(10)

            words << units[i][:suffix]            if units[i][:suffix] && segment > 0
            words << to_english(parts.last)       if parts.last > 0
            words << to_english(10 * parts.first) if parts.first > 0
            words << units[i][:prefix]            if units[i][:prefix] && segment > 0 && number > 0

            if i == units.length - 1 && number > 0
              # suffix crore and start over
              words << 'crore,'
              i = 0
            else
              i += 1
            end
          end

          regex = @comma ? /, ,|,$/ : /, ,|,/
          words.reverse.join(' ').gsub(/#{regex}/, '')
        end
      end
    end
  end
end
