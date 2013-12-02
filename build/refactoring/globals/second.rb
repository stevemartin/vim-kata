class Second
  def initialize
    @yi = Yi.new
    @third = Third.new
    @fourth = Fourth.new
    @fifth = Fifth.new
  end

  def yi_index
    Yi.all
  end

  def third_index
    Third.all
  end

  def fourth_index
    Fourth.all
  end

  def fifth_index
    Fifth.all
  end
end

