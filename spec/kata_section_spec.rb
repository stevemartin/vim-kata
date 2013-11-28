require 'lib/kata_section.rb'

describe KataSection do
  before(:each) do
    @src = 'src/chapter/section-topic/pages.yaml'
    @dest = 'build/chapter/section-topic/addresses.toc'
    @filelist = %w{tut-1 exe-1}
    YAML.should_receive(:load_file).with(@src).and_return(@filelist)
    KataPage.stub(:new)
  end
  context 'title' do
    it 'is extracted from directory structure' do
      section = KataSection.new(@src)
      section.title.should == 'section-topic'
    end
  end
  context 'pages' do
    it 'lists pages in TOC order' do
      page = double
      KataPage.should_receive(:new).with('tut-1').and_return(page)
      KataPage.should_receive(:new).with('exe-1').and_return(page)
      section = KataSection.new(@src)
      section.pages.should == [page, page]
    end
  end
  context 'files' do
    it 'lists each page source file' do
      section = KataSection.new(@src)
      section.files.should == @filelist
    end
  end
  context 'destination' do
    it 'mirrors TOC path in build/ directory' do
      section = KataSection.new(@src)
      section.destination.should == @dest
    end
  end
  context 'addresses' do
    it 'returns a list of addresses from each page' do
      tut, exe = double, double
      address1, address2 = double('a1'), double('a2')
      KataPage.should_receive(:new).with('tut-1').and_return(tut)
      KataPage.should_receive(:new).with('exe-1').and_return(exe)
      tut.should_receive(:addresses).and_return([address1])
      exe.should_receive(:addresses).and_return([address2])
      section = KataSection.new(@src)
      section.addresses.should == "#{address1}\n#{address2}"
    end
  end
  context 'buildtoc' do
    it 'writes a file with addresses for each page' do
      section = KataSection.new(@src)
      FileUtils.should_receive(:mkdir_p).with('build/chapter/section-topic')
      file = mock('file')
      File.should_receive(:open).with(@dest, "w").and_yield(file)
      file.should_receive(:write).with('list of addresses')
      section.should_receive(:addresses).and_return('list of addresses')

      section.buildtoc
    end
  end
end
