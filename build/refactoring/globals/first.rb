class Yi
  def initialize
    @second = Second.new
    @third = Third.new
    @fourth = Fourth.new
    @fifth = Fifth.new
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

  def fifth_index
    Fifth.all
  end
end
