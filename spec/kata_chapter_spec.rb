require 'lib/kata_chapter.rb'

describe KataChapter do
  before(:each) do
    @src = 'src/chapter/sections.yaml'
    @dest = 'build/chapter/index.kata'
    @sectionlist = %w{modal-editing copy-paste}
    YAML.should_receive(:load_file).with(@src).and_return(@sectionlist)
    KataSection.stub(:new)
  end

  context 'sections' do
    it 'returns a list of KataSections' do
      section = double
      KataSection.should_receive(:new).with('modal-editing').and_return(section)
      KataSection.should_receive(:new).with('copy-paste').and_return(section)
      chapter = KataChapter.new(@src)
      chapter.sections.should == [section, section]
    end
  end
  context 'index' do
    it 'returns a list of section titles' do
      section1, section2 = double, double
      KataSection.should_receive(:new).with('modal-editing').and_return(section1)
      KataSection.should_receive(:new).with('copy-paste').and_return(section2)
      section1.should_receive(:title).and_return('modal-editing')
      section2.should_receive(:title).and_return('copy-paste')
      chapter = KataChapter.new(@src)
      chapter.index.should == "modal-editing\ncopy-paste"
    end
  end
  context 'destination' do
    it 'returns filename of the chapter.kata index page' do
      chapter = KataChapter.new(@src)
      chapter.destination.should == @dest
    end
  end
  context 'buildindex' do
    it 'writes a file with title of each section in order' do
      chapter = KataChapter.new(@src)
      FileUtils.should_receive(:mkdir_p).with('build/chapter')
      file = mock('file')
      File.should_receive(:open).with(@dest, "w").and_yield(file)
      file.should_receive(:write).with('list of sections')
      chapter.should_receive(:index).and_return('list of sections')

      chapter.buildindex
    end
  end
end
