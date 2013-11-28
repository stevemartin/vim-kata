class KataAddress
  attr_accessor :column, :format

  def initialize(options={})
    options = {
      :format => '%f|%l col %c|%m'
    }.merge(options)

    @filename   = options[:filename]
    @linenumber = options[:linenumber].to_s
    @format     = options[:format]
    if !options[:text].nil? && !options[:text].empty?
      @column = (options[:text].index("^")+1).to_s
    end
  end

  def to_s
    @format.sub("%f", @filename).sub("%l", @linenumber).sub("%c", @column)
  end
end
