class Fourth
  def initialize
    @first = First.new
    @second = Second.new
    @third = Third.new
    @fifth = Fifth.new
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

  def fifth_index
    Fifth.all
  end
end
