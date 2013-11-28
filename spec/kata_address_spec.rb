require 'rubygems'
require 'rspec'
require 'lib/kata_address.rb'

describe KataAddress do
  context 'column' do
    it "extracts column number from ^ location" do
      column_one = KataAddress.new(:text => "^")
      column_one.column.should == "1"

      column_two = KataAddress.new(:text => " ^")
      column_two.column.should == "2"
    end
  end
  context 'format' do
    it "has default value" do
      address = KataAddress.new()
      address.format.should == "%f|%l col %c|%m"
    end
    it "can override the default value" do
      address = KataAddress.new(:format => "%f")
      address.format.should == "%f"
    end
  end
  context 'to_s' do
    it 'uses format' do
      address = KataAddress.new(
        :filename => 'tutorial-1', 
        :linenumber => 3, 
        :text => '^'
      )
      address.to_s.should match(/^tutorial-1/)
      address.to_s.should match(/\|3 col 1\|/)
    end
  end
end
