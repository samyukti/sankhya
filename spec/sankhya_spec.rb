# frozen_string_literal: true

require 'spec_helper'

describe Sankhya do
  it 'converts 0 to words' do
    0.to_words.should eql('zero')
  end

  it 'converts 5,36,24,133 to words' do
    53_624_133.to_words.should eql('five crore, thirty six lakh, twenty four thousand, one hundred and thirty three')
  end

  it 'converts 12,12,012 to words' do
    1_212_012.to_words.should eql('twelve lakh, twelve thousand and twelve')
  end

  it 'converts 7,00,007 to words' do
    700_007.to_words.should eql('seven lakh and seven')
  end

  it 'converts 1,01,01,101 to words' do
    10_101_101.to_words.should eql('one crore, one lakh, one thousand, one hundred and one')
  end

  it 'converts 33,00,00,000 to words' do
    330_000_000.to_words.should eql('thirty three crore')
  end

  it 'converts 10,00,000 to words' do
    1_000_000.to_words.should eql('ten lakh')
  end

  it 'converts 99,000 to words' do
    99_000.to_words.should eql('ninety nine thousand')
  end

  it 'converts 0.0 to words' do
    (0.0).to_words.should eql(['zero', 'zero'])
  end

  it 'converts 1.1 to words' do
    (1.1).to_words.should eql(['one', 'ten'])
  end

  it 'converts 1.1 with scale 1 to words' do
    (1.1).to_words(scale: 1).should eql(['one', 'one'])
  end

  it 'converts 1.01 with scale 2 to words' do
    (1.01).to_words(scale: 2).should eql(['one', 'one'])
  end

  it 'converts 3.14 to words' do
    (3.14).to_words.should eql(['three', 'fourteen'])
  end

  it 'converts 29,97,924.58 to words' do
    (2_997_924.58).to_words.should eql(['twenty nine lakh, ninety seven thousand, nine hundred and twenty four', 'fifty eight'])
  end

  it 'converts 143,29,97,924.58 to words' do
    (1_432_997_924.58).to_words.should eql(['one hundred and forty three crore, twenty nine lakh, ninety seven thousand, nine hundred and twenty four', 'fifty eight'])
  end

  it 'converts 2,07,143,29,97,924.58 to words' do
    (2_071_432_997_924.58).to_words.should eql(['two lakh, seven thousand, one hundred and forty three crore, twenty nine lakh, ninety seven thousand, nine hundred and twenty four', 'fifty eight'])
  end

  # it 'converts 22,99,11,123,45,67,890.76 to words' do
  #   (2299111234567890.76).to_words.should eql(['twenty two crore, ninety nine lakh, eleven thousand, one hundred and twenty three crore, forty five lakh, sixty seven thousand, eight hundred and ninety', 'seventy six'])
  # end

  it 'converts 21,89,14,967,50,95,052.8 to words' do
    (2_189_149_675_095_052.8).to_words.should eql(['twenty one crore, eighty nine lakh, fourteen thousand, nine hundred and sixty seven crore, fifty lakh, ninety five thousand and fifty two', 'eighty'])
  end

  it 'converts 10,10,110.10 to words without comma' do
    (1_010_110.10).to_words(comma: false).should eql(['ten lakh ten thousand one hundred and ten', 'ten'])
  end

  it 'converts 10,10,110.10 to words without comma, if comma option is a truthy value' do
    (1_010_110.10).to_words(comma: 'false').should eql(['ten lakh, ten thousand, one hundred and ten', 'ten'])
  end

  it 'converts 10,10,110.10 to words with scale -2' do
    (1_010_110.10).to_words(scale: -2).should eql(['ten lakh, ten thousand, one hundred and ten', 'zero'])
  end

  it 'converts 10,10,110.10 to words with scale -1' do
    (1_010_110.10).to_words(scale: -1).should eql(['ten lakh, ten thousand, one hundred and ten', 'zero'])
  end

  it 'converts 10,10,110.10 to words with scale 0' do
    (1_010_110.10).to_words(scale: 0).should eql(['ten lakh, ten thousand, one hundred and ten', 'zero'])
  end

  it 'converts 10,10,110.10 to words with scale 2, if scale option is an invalid value' do
    (1_010_110.10).to_words(scale: 'one').should eql(['ten lakh, ten thousand, one hundred and ten', 'ten'])
  end

  it 'converts 10,10,110.10 to words with scale 1' do
    (1_010_110.10).to_words(scale: 1).should eql(['ten lakh, ten thousand, one hundred and ten', 'one'])
  end

  it 'converts 10,10,110.10 to words with scale 2' do
    (1_010_110.10).to_words(scale: 2).should eql(['ten lakh, ten thousand, one hundred and ten', 'ten'])
  end

  it 'converts 10,10,110.10 to words with scale 3' do
    (1_010_110.10).to_words(scale: 3).should eql(['ten lakh, ten thousand, one hundred and ten', 'one hundred'])
  end

  it 'converts 1 to amount' do
    (1).to_amount.should eql('1.00')
  end

  it 'converts 10.10 to amount' do
    (10.10).to_amount.should eql('10.10')
  end

  it 'converts 10.100 to amount' do
    (10.100).to_amount.should eql('10.10')
  end

  it 'converts 100.10 to amount' do
    (100.10).to_amount.should eql('100.10')
  end

  it 'converts 1000.10 to amount' do
    (1_000.10).to_amount.should eql('1,000.10')
  end

  it 'converts 10000.10 to amount' do
    (10_000.10).to_amount.should eql('10,000.10')
  end

  it 'converts 10000000.10 to amount' do
    (10_000_000.10).to_amount.should eql('1,00,00,000.10')
  end

  it 'converts 100000000.10 to amount' do
    (100_000_000.10).to_amount.should eql('10,00,00,000.10')
  end

  it 'converts 100000000.10 to amount' do
    (100_000_000.10).to_amount(scale: 3).should eql('10,00,00,000.100')
  end
end
