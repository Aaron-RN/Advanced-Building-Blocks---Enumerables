  module Enumerable
    def my_each
      # your code here
      return to_enum(:double) unless block_given?
      for i in 0..self.length-1
        yield(self[i])
      end
      return self
    end

    def my_each_with_index
      return to_enum(:double) unless block_given?
      for i in 0..self.length-1
        yield(self[i],i)
      end
      return self
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
      return to_enum(:double) unless block_given? || !proc
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
      finalValue = initial
      arrayToCalc = []
      arrayToCalc = self.to_a
      arrayToCalc.my_each do |item|
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