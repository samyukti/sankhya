# Sankhya

Sankhya is a little gem to convert number to words in Indian Numbering System.

## Installation

Add this line to your application's Gemfile:

    gem 'sankhya'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sankhya

## Usage

Sankhya add a 'to_words' method to Integer and Float classes.

    10101101.to_words    # "one crore, one lakh, one thousand, one hundred and one"
    0.to_words           # "zero"

    1.1.to_words         # ["one", "ten"]
    1.1.to_words         # ["one", "one"]
    1.01.to_words        # ["one", "one"]


Please see the spec for more examples.

## Contributing

1. Fork it ( http://github.com/samyukti/sankhya/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
