  module Enumerable
    def my_each
      # your code here
      return to_enum(:double) unless block_given?
      for i in 0..self.length-1
        yield(self[i])
      end
    end

    def my_each_with_index
      return to_enum(:double) unless block_given?
      for i in 0..self.length-1
        yield(self[i],i)
      end
    end

    def my_select
      return to_enum(:double) unless block_given?
      conditionMet = []
      self.my_each do |item|
        if yield(item)
          conditionMet << item
        end
      end
      conditionMet
    end

    def my_all?(pattern = nil)
      self.my_each do |item|
        if block_given?
          unless yield(item)
            return false
          end
        else
          if pattern
            unless pattern === (item)
              return false
            end
          else
            if item == nil||item == false
              return false
            end
          end
        end
      end
      return true
    end

    def my_any?(pattern = nil)
      self.my_each do |item|
        if block_given?
          if yield(item)
            return true
          end
        else
          if pattern
            if pattern === (item)
              return true
            end
          else
            if item == nil||item == false
              return true
            end
          end
        end
      end
      return false
    end

    def my_none?(pattern = nil)
      self.my_each do |item|
        if block_given?
          if yield(item)
            return false
          end
        else
          if pattern
            if pattern === (item)
              return false
            end
          else
            if item == nil||item == false
              return false
            end
          end
        end
      end
      return true
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

    def my_map(proc = nil)
      return to_enum(:double) unless block_given? && !proc
      newArray = []
      self.my_each do |item|
          if proc
            newArray << proc.call(item)
          else
            newArray << yield(item)
          end
      end
      return newArray
    end

    def my_inject(initial = 0, operator = nil)
      if initial.class == Symbol
        operator = initial
        initial = 0
      end
      finalValue = 0
      arrayToCalc = []
      arrayToCalc = self.to_a
      finalValue = arrayToCalc[initial]
      arrayToCalc.my_each_with_index do |item, i|
        if i == initial
          next
        end
        if operator!=nil && !block_given?
          finalValue = finalValue.public_send(operator.to_sym, item)
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
  # puts ".each"
  # puts arrT.each

  # puts ".my_each"
  # puts arrT.my_each

  # puts "\n.each_with_index"
  # arrT.each_with_index do |item, i|
  #   puts item, i
  # end

  # puts ".my_each_with_index"
  # arrT.my_each_with_index do |item, i|
  #   puts item, i
  # end

  # puts "\n.select"
  # puts arrT.select {|item| item.odd?}
  # puts ".my_select"
  # puts arrT.my_select {|item| item.odd?}

  # puts "\n.all?"
  # puts %w[ant bear cat].all? { |word| word.length >= 3 }
  # puts %w[ant bear cat].all? { |word| word.length >= 4 }
  # puts %w[ant bear cat].all?(/a/)
  # puts [1, 2i, 3.14].all?(Numeric)                       
  # puts [nil, true, 99].all?                     
  # puts [].all?
  # puts ".my_all?"
  # puts %w[ant bear cat].my_all? { |word| word.length >= 3 }
  # puts %w[ant bear cat].my_all? { |word| word.length >= 4 }
  # puts %w[ant bear cat].my_all?(/a/)
  # puts [1, 2i, 3.14].my_all?(Numeric)                       
  # puts [nil, true, 99].my_all?                     
  # puts [].my_all?

  # puts "\n.any?"
  # puts %w[ant bear cat].any? { |word| word.length >= 3 }
  # puts %w[ant bear cat].any? { |word| word.length >= 4 }
  # puts %w[ant bear cat].any?(/d/)
  # puts [nil, true, 99].any?(Integer)
  # puts [nil, true, 99].any?
  # puts [].any?
  # puts ".my_any"
  # puts %w[ant bear cat].my_any? { |word| word.length >= 3 }
  # puts %w[ant bear cat].my_any? { |word| word.length >= 4 }
  # puts %w[ant bear cat].my_any?(/d/)
  # puts [nil, true, 99].my_any?(Integer)
  # puts [nil, true, 99].my_any?
  # puts [].my_any?

  # puts "\n.none"
  # puts %w[ant bear cat].none? { |word| word.length >= 3 }
  # puts %w[ant bear cat].none? { |word| word.length >= 4 }
  # puts %w[ant bear cat].none?(/d/)
  # puts [nil, true, 99].none?(Integer)
  # puts [nil, true, 99].none?
  # puts [].none?
  # puts ".my_none"
  # puts %w[ant bear cat].my_none? { |word| word.length >= 3 }
  # puts %w[ant bear cat].my_none? { |word| word.length >= 4 }
  # puts %w[ant bear cat].my_none?(/d/)
  # puts [nil, true, 99].my_none?(Integer)
  # puts [nil, true, 99].my_none?
  # puts [].my_none?

  # puts "\n.count"
  # puts "arrT = [#{arrT.join(",")}]"
  # puts "arrT.count: #{arrT.count}"
  # puts "arrT.count(20): #{arrT.count(20)}"
  # puts "arrT.count(|item| item > 20): #{arrT.count {|item| item > 20}}"
  # puts ".my_count"
  # puts "arrT = [#{arrT.join(",")}]"
  # puts "arrT.my_count: #{arrT.my_count}"
  # puts "arrT.my_count(20): #{arrT.my_count(20)}"
  # puts "arrT.my_count(|item| item > 20): #{arrT.my_count {|item| item > 20}}"

  # puts "\n.map"
  # puts "arrT.map {|item| item - 1}: #{arrT.map {|item| item - 1}}"
  # puts ".my_map"
  # puts "arrT.my_map {|item| item - 1}: #{arrT.my_map {|item| item - 1}}"

  puts "\n.inject"
  puts arrT.inject(:+)
  puts (5..10).inject { |sum, n| sum + n }
  puts (5..10).inject(1, :*)
  puts (5..10).inject(1) { |product, n| product * n }
  puts %w{ cat sheep bear }.inject { |memo, word| memo.length > word.length ? memo : word }

  puts "\n.my_inject"
  puts arrT.my_inject(:+)
  puts (5..10).my_inject { |sum, n| sum + n }
  puts (5..10).my_inject(1, :*)
  puts (5..10).my_inject(1) { |product, n| product * n }
  puts %w{ cat sheep bear }.my_inject { |memo, word| memo.length > word.length ? memo : word }

  # puts "\n.multiply_els"
  # puts arrT.multiply_els

  # puts "\n.my_map proc"
  # proc = Proc.new {|item| item - 2}
  # puts "proc = Proc.new {|item| item - 2}"
  # puts "arrT.my_map(proc): #{arrT.my_map(proc)}"