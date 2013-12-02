class Fifth
  def initialize
    @first = First.new
    @second = Second.new
    @third = Third.new
    @fourth = Fourth.new
  end

  def first_index
    First.all
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
