require 'spec_helper'

describe Sankhya do

  it "converts 0 to words" do
    0.to_words.should eql("zero")
  end

  it "converts 5,36,24,133 to words" do
    53624133.to_words.should eql("five crore, thirty six lakh, twenty four thousand, one hundred and thirty three")
  end

  it "converts 12,12,012 to words" do
    1212012.to_words.should eql("twelve lakh, twelve thousand and twelve")
  end

  it "converts 7,00,007 to words" do
    700007.to_words.should eql("seven lakh and seven")
  end

  it "converts 1,01,01,101 to words" do
    10101101.to_words.should eql("one crore, one lakh, one thousand, one hundred and one")
  end

  it "converts 33,00,00,000 to words" do
    330000000.to_words.should eql("thirty three crore")
  end

  it "converts 10,00,000 to words" do
    1000000.to_words.should eql("ten lakh")
  end

  it "converts 99,000 to words" do
    99000.to_words.should eql("ninety nine thousand")
  end

  it "converts 0.0 to words" do
    (0.0).to_words.should eql(["zero", "zero"])
  end

  it "converts 1.1 to words" do
    (1.1).to_words.should eql(["one", "ten"])
  end

  it "converts 1.1 with scale 1 to words" do
    (1.1).to_words(scale: 1).should eql(["one", "one"])
  end

  it "converts 1.01 with scale 2 to words" do
    (1.01).to_words(scale: 2).should eql(["one", "one"])
  end

  it "converts 3.14 to words" do
    (3.14).to_words.should eql(["three", "fourteen"])
  end

  it "converts 29,97,924.58 to words" do
    (2997924.58).to_words.should eql(["twenty nine lakh, ninety seven thousand, nine hundred and twenty four", "fifty eight"])
  end

  it "converts 143,29,97,924.58 to words" do
    (1432997924.58).to_words.should eql(["one hundred and forty three crore, twenty nine lakh, ninety seven thousand, nine hundred and twenty four", "fifty eight"])
  end

  it "converts 2,07,143,29,97,924.58 to words" do
    (2071432997924.58).to_words.should eql(["two lakh, seven thousand, one hundred and forty three crore, twenty nine lakh, ninety seven thousand, nine hundred and twenty four", "fifty eight"])
  end

end
