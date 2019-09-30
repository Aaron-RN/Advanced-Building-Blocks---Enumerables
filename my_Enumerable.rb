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

    def my_select
      conditionMet = []
      self.my_each do |item|
        if yield(item)
          conditionMet << item
        end
      end
      conditionMet
    end

    def my_all?
      self.my_each do |item|
        unless yield(item)
          return false
        end
      end
      return true
    end

    def my_any?
      self.my_each do |item|
        if yield(item)
          return true
        end
      end
      return false
    end
  end

  arrT = [11,20,33,40]
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

  puts "\n.select"
  puts arrT.select {|item| item.odd?}
  puts ".my_select"
  puts arrT.my_select {|item| item.odd?}

  puts "\n.all?"
  puts arrT.all? {|item| item.even?}
  puts ".my_all?"
  puts arrT.my_all? {|item| item.even?}

  puts "\n.any?"
  puts arrT.any? {|item| item.even?}
  puts ".my_any"
  puts arrT.my_any? {|item| item.even?}