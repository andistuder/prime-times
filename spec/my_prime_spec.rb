require 'my_prime'
require 'prime'

describe MyPrime do
  describe '#first' do
    let(:length) {10}
    subject {MyPrime.first(length)}
    it "should return an array with # elements as requested" do
      subject.length.should == length
    end
    it "the numbers should be in order of smallest first" do
      subject.each_with_index do |n, i|
        (n > subject[i-1]).should be_true if i > 0
      end
    end
    it "all numbers should be prime numbers" do
      subject.each do |n|
        Prime.prime?(n).should be_true
      end
    end
    it "no prime numbers should be left out" do
      Prime.first(length).each do |n|
        subject.include?(n).should be_true
      end
    end
    it "should return an empty arry if called with argument = 0" do
      MyPrime.first(0).should == []
    end
    # or just plain lazy
    it "should should return the same as Prime.first(n)" do
      MyPrime.first(100).should == Prime.first(100)
    end
  end
end