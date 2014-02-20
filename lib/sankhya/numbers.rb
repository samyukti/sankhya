module Sankhya

  class Numbers
    extend Words

    def self.translate(number, options)
      parse options

      if number.integer?
        words_of(number)
      else # if float
        integer = number.floor
        decimal = (number * (10 ** @scale)).floor - (integer * (10 ** @scale))
        [words_of(integer), words_of(decimal)]
      end
    end

  private

    def self.is_number?(number)
      true if Float(number) rescue false
    end

    def self.parse(options)
      @comma = options.has_key?(:comma) ? options[:comma] : true
      @scale = is_number?(options[:scale]) ? ([options[:scale], 0].max) : 2
    end

    def self.words_of(number)
      if number < 20
        self.to_english(number)
      else
        words = []

        units = [{divisor: 100, prefix: ', and' },
                 {divisor: 10,  suffix: 'hundred,' },
                 {divisor: 100, suffix: 'thousand,' },
                 {divisor: 100, suffix: 'lakh,' }]

        i = 0
        while i < units.length
          number, segment = number.divmod(units[i][:divisor])
          parts = segment < 20 ? segment.divmod(100) : segment.divmod(10)

          words << units[i][:suffix]                 if units[i][:suffix] and segment > 0
          words << self.to_english(parts.last)       if parts.last > 0
          words << self.to_english(10 * parts.first) if parts.first > 0
          words << units[i][:prefix]                 if units[i][:prefix] and segment > 0 and number > 0

          if i == units.length - 1 and number > 0
            # suffix crore and and start over
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
