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

    def my_none?
      self.my_each do |item|
        unless yield(item)
          return true
        end
      end
      return false
    end

    def my_count(value = nil)
      counter = 0
      self.my_each do |item|
        if value == nil &&  !block_given?
          counter += 1
        else
          if block_given?
            if yield(item)
              counter += 1
            end
          else
            if item == value
              counter += 1
            end
          end
        end
      end
      return counter
    end

    def my_map
      return __method__ if !block_given?
      newArray = []
      self.my_each do |item|
          newArray << yield(item)
      end
      return newArray
    end

    def my_inject(operator = nil)
      finalValue = 0
      self.my_each_with_index do |item, i|
        if i == 0
          finalValue = item
          next
        end
        if operator!=nil && !block_given?
          if operator.to_s == "+"
            finalValue = finalValue + item
          elsif operator.to_s == "-"
            finalValue = finalValue - item
          elsif operator.to_s == "*"
            finalValue = finalValue * item
          elsif operator.to_s == "/"
            finalValue = finalValue / item
          elsif operator.to_s == "%"
            finalValue = finalValue % item
          elsif operator.to_s == "**"
            finalValue = finalValue ** item
          end
        else
          if block_given?
            finalValue = yield(finalValue, item)
          end
        end
      end
      return finalValue
    end

    def multiply_els
      self.my_inject(:*)
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

  puts "\n.none"
  puts arrT.none? {|item| item < 10}
  puts ".my_none"
  puts arrT.my_none? {|item| item < 10}

  puts "\n.count"
  puts "arrT = [#{arrT.join(",")}]"
  puts "arrT.count: #{arrT.count}"
  puts "arrT.count(20): #{arrT.count(20)}"
  puts "arrT.count(|item| item > 20): #{arrT.count {|item| item > 20}}"
  puts ".my_count"
  puts "arrT = [#{arrT.join(",")}]"
  puts "arrT.my_count: #{arrT.my_count}"
  puts "arrT.my_count(20): #{arrT.my_count(20)}"
  puts "arrT.my_count(|item| item > 20): #{arrT.my_count {|item| item > 20}}"

  puts "\n.map"
  puts "arrT.map {|item| item - 1}: #{arrT.map {|item| item - 1}}"
  puts ".my_map"
  puts "arrT.my_map {|item| item - 1}: #{arrT.my_map {|item| item - 1}}"

  puts "\n.inject"
  puts "arrT.inject(:+) = #{arrT.inject(:+)}"
  puts "arrT.inject {|sum, n| sum + n} = #{arrT.inject {|sum, n| sum - n}}"
  puts ".my_inject"
  puts "arrT.my_inject(:+) = #{arrT.my_inject(:+)}"
  puts "arrT.my_inject {|sum, n| sum + n} = #{arrT.my_inject {|sum, n| sum - n}}"

  puts "\n.multiply_els"
  puts arrT.multiply_els