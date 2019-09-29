  module Enumerable
    def my_each
      # your code here
      for i in 0..self.length
        yield(self[i])
      end
    end
  end

  arrT = [1,2,3,4]
  puts ".each"
  arrT.each do |item|
    puts item
  end

  puts ".my_each"
  arrT.my_each do |item|
    puts item
  end