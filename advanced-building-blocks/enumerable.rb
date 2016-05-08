module Enumerable
  def my_each
    return self unless block_given?
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    return self unless block_given?
    for i in 0..self.length
      yield(self[i], i)
    end
  end

  def my_select
    selection = []
    my_each {|i| selection << i if yield(i)}
    selection
  end

  
end