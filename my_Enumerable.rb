  module Enumerable
    def my_each
      # your code here
      for i in 0..self.length-1
        yield(self[i])
      end
    end

    def my_each_with_index
      for i in 0..self.length-1
        yield(self[i],i)
      end
    end
  end

  arrT = [10,20,30,40]
  puts ".each"
  arrT.each do |item|
    puts item
  end

  puts ".my_each"
  arrT.my_each do |item|
    puts item
  end

  puts "\n.each_with_index"
  arrT.each_with_index do |item, i|
    puts item, i
  end

  puts ".my_each_with_index"
  arrT.my_each_with_index do |item, i|
    puts item, i
  end