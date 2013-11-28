require './lib/kata_page'
require 'yaml'

class KataSection
  attr_reader :pages, :files, :destination, :title

  def initialize(source)
    @source = source
    @destination = @source.sub('src', 'build').sub('pages.yaml','addresses.toc')
    @title = File.basename(File.dirname(@destination))
    @files = YAML.load_file(@source)
    @pages = @files.map { |file| KataPage.new(file) }
  end

  def addresses
    @pages.map do |page|
      page.addresses
    end.flatten.join("\n")
  end

  def buildtoc
    FileUtils.mkdir_p(File.dirname(@destination))
    File.open(@destination, "w") { |f| f.write(addresses) }
  end

  def build
    buildtoc
    @pages.each { |page| page.build }
  end
end
