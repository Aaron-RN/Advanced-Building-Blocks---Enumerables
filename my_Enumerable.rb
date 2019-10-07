# frozen_string_literal: true

module Enumerable
  def my_each
    return to_enum(:double) unless block_given?

    (0..length - 1).each do |i|
      yield(self[i])
    end
    self
  end

  def my_each_with_index
    return to_enum(:double) unless block_given?

    (0..length - 1).each do |i|
      yield(self[i], i)
    end
    self
  end

  def my_select
    return to_enum(:double) unless block_given?

    condition_met = []
    my_each do |item|
      condition_met << item if yield(item)
    end
    condition_met
  end

  def my_all?(pattern = nil)
    my_each do |item|
      if block_given?
        return false unless yield(item)
      elsif pattern
        return false unless pattern === item
      else
        return false if item.nil? || item == false
      end
    end
    true
  end

  def my_any?(pattern = nil)
    my_each do |item|
      if block_given?
        return true if yield(item)
      elsif pattern
        return true if pattern === item
      else
        return true if item == true
      end
    end
    false
  end

  def my_none?(pattern = nil)
    my_each do |item|
      if block_given?
        return false if yield(item)
      elsif pattern
        return false if pattern === item
      else
        return false if item == true
      end
    end
    true
  end

  def my_count(value = nil)
    counter = 0
    my_each do |item|
      if value.nil? && !block_given?
        counter += 1
      elsif block_given?
        counter += 1 if yield(item)
      else
        counter += 1 if item == value
      end
    end
    counter
  end

  def my_map(proc = nil)
    return to_enum(:double) if !block_given? && !proc

    new_array = []
    my_each do |item|
      new_array << if proc
                     proc.call(item)
                   else
                     yield(item)
                   end
    end
    new_array
  end

  def my_inject(initial = nil, operator = nil)
    if initial.class == Symbol
      operator = initial
      initial = 0
    end
    skip_index = nil
    final_value = nil
    array_to_calc = to_a
    final_value = initial || array_to_calc[0]
    skip_index = 0 unless initial
    array_to_calc.my_each_with_index do |item, i|
      next if i == skip_index

      if !operator.nil? && !block_given?
        final_value = final_value.public_send(operator.to_sym, item)
      elsif block_given?
        final_value = yield(final_value, item)
      end
    end
    final_value
  end

  def multiply_els
    my_inject(:*)
  end
end
