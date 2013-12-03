class Fifth
  def initialize
    @yi = Yi.new
    @second = Second.new
    @third = Third.new
    @fourth = Fourth.new
  end

  def yi_index
    Yi.all
  end

  def second_index
    Second.all
  end

  def third_index
    Third.all
  end

  def fourth_index
    Fourth.all
  end
end
