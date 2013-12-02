class Second
  def initialize
    @first = First.new
    @third = Third.new
    @fourth = Fourth.new
    @fifth = Fifth.new
  end

  def first_index
    First.all
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

