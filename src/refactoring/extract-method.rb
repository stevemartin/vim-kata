class Foo
  def return_key
    'scoobydooby'
  end

  def select_method
    @commands = ':normal gg'
    @commands << return_key
  end
end

