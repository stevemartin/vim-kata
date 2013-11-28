require 'lib/kata_page.rb'

describe KataPage do

  before(:each) do
      @input_text = <<-EOF
one
^
two
 ^
three
      EOF

      @stripped_file = <<-EOF
one
two
three
      EOF

      @src = 'src/chapter/section/tut-1'
      @dest = 'build/chapter/section/tut-1'
      @file = mock('file')
      File.should_receive(:open).with(@src, "r").and_return(@file)
      @file.should_receive(:map).and_return(@input_text)
  end

  context 'destination' do
    it 'reflects source directory structure' do
      page = KataPage.new(@src)
      page.destination.should == @dest
    end
  end
  context 'contents' do
    it 'matches input file contents' do
      page = KataPage.new(@src)
      page.contents.should == @input_text
    end
  end
  context 'stripped_output' do
    it 'matches input file, but with "^" lines removed' do
      page = KataPage.new(@src)
      page.stripped_output.should == @stripped_file
    end
  end
  context 'addresses' do
    it 'creates a new KataAddress' do
      address = double
      KataAddress.should_receive(:new).with({
          :filename   => @dest,
          :linenumber => 1,
          :text       => '^'
      }).once().and_return(address)
      KataAddress.should_receive(:new).with({
          :filename   => @dest,
          :linenumber => 2,
          :text       => ' ^'
      }).once().and_return(address)

      page = KataPage.new(@src)
      page.addresses.should == [address, address]
    end
  end
  context 'build' do
    it 'writes stripped_output to a file at destination' do
      FileUtils.should_receive(:mkdir_p).with('build/chapter/section')
      file = mock('file')
      File.should_receive(:open).with(@dest, "w").and_yield(file)
      file.should_receive(:write).with(@stripped_file)

      page = KataPage.new(@src)
      page.build
    end
  end
end
