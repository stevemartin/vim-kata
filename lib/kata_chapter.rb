require './lib/kata_section'

class KataChapter
  attr_reader :sections, :destination

  def initialize(source)
    @destination = source.sub('src','build').sub('sections.yaml','index.kata')
    files = YAML.load_file(source)
    @sections = files.map { |file| KataSection.new(file) }
  end

  def index
    @sections.map { |s| s.title }.join("\n")
  end

  def buildindex
    FileUtils.mkdir_p(File.dirname(@destination))
    File.open(@destination, "w") { |f| f.write(index) }
  end

  def build
    buildindex
    @sections.each { |section| section.build }
  end
end
