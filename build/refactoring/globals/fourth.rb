class Fourth
  def initialize
    @yi = Yi.new
    @second = Second.new
    @third = Third.new
    @fifth = Fifth.new
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

  def fifth_index
    Fifth.all
  end
end
