require './lib/kata_address'
require 'fileutils'

class KataPage
  attr_reader :contents, :addresses, :destination

  def initialize(source)
    @filepath = source
    @destination = @filepath.sub('src', 'build')
    @keeplines, @addresses = [], []
    @contents = File.open(source, 'r').map { |line| line }
    @contents.each do |line|
      if line =~ /\^/
        @addresses << KataAddress.new(
          :filename   => @destination,
          :linenumber => @keeplines.size,
          :text       => line.sub(/\n/,''))
      else
        @keeplines.push(line.chomp)
      end
    end
    @keeplines.push('') # newline at EOF
  end

  def stripped_output
    @keeplines.join("\n")
  end

  def build
    FileUtils.mkdir_p(File.dirname(@destination))
    File.open(@destination, "w") { |f| f.write(stripped_output) }
  end

end
