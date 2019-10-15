# frozen_string_literal: true

# spec/my_enumerable_spec.rb

require_relative '../my_enumerable'

RSpec.describe '#my_each' do
  let(:string_input) { %w[ronnie mcDonnie] }
  let(:output) { %w[] }

  it 'returns an enumerable if not passed a block' do
    expect(string_input.my_each).to be_a(Enumerable)
  end

  it 'performs operation in block on each item collection member' do
    string_input.my_each { |item| output << item.upcase }
    expect(output).to eql(%w[RONNIE MCDONNIE])
  end

  it 'returns original array given' do
    expect([1, 2, 4].my_each { |item| item}).to eql([1, 2, 4])
  end
end

RSpec.describe '#my_each_with_index' do
  let(:input) { [5, 10, 15, 20] }
  let(:output) { [] }

  it 'returns an enumerable if not passed a block' do
    expect(input.my_each_with_index).to be_a(Enumerable)
  end

  it 'performs operation in block on each item collection member' do
    input.my_each_with_index { |item, i| output << item * i }
    expect(output).to eql([0, 10, 30, 60])
  end

  it 'returns original array given' do
    expect(input.my_each_with_index { |item, i| item * i }).to eql([5, 10, 15, 20])
  end
end


RSpec.describe '#my_select' do
  let(:input) { [5, 10, 15, 20] }

  it 'returns an enumerable if not passed a block' do
    expect(input.my_select).to be_a(Enumerable)
  end

  it 'returns array of item collection members that pass the select criteria' do
    expect(input.my_select { |item| item.even? }).to eql([10, 20])
  end

  it 'returns array of item collection members that pass the select criteria' do
    expect(%w[rumple dumple crumple nope].my_select { |item| item.match('umple') }).to eql(%w[rumple dumple crumple])
  end
end

RSpec.describe '#my_all?' do
  let(:input) { [5, 10, 15, 20] }
  let(:input_str) { %w[slide wide hide] }

  it 'returns true when no collection member if false or nil when no block is given' do
    expect(input.my_all?).to eql(true)
  end

  it 'performs operation in block on each item collection member' do
    expect(input.my_all? { |item| item % 5 == 0 }).to eql(true)
  end

  it 'returns whether all collection members have a specified pattern' do
    expect(input_str.my_all?(/ide/)).to eql(true)
  end
end

RSpec.describe '#my_map' do
  let(:input) { [5, 10, 15, 20] }
  let(:input_str) {%w[rumple dumple crumple nope]}

  it 'returns an enumerable if not passed a block' do
    expect(input.my_map).to be_a(Enumerable)
  end

  it 'returns a new array with the results of running block once for every element in enum' do
    expect(input.my_map { |item| item * 2 }).to eql([10, 20, 30, 40])
  end

  it 'returns a new array with the results of running block once for every element in enum' do
    expect(input_str.my_map { |item| item + 'ish' }).to eql(%w[rumpleish dumpleish crumpleish nopeish])
  end

  it 'returns a new array with the results of running block once for every element in enum' do
    expect(input_str.my_map(&:upcase)).to eql(%w[RUMPLE DUMPLE CRUMPLE NOPE])
  end
end

RSpec.describe '#my_inject' do
  let(:input) { [5, 10, 15, 20] }
  let(:input_str) { %w[slide wide hide] }

  it 'returns the final accumulated value plus the initial value' do
    expect(input.my_inject(2, :+)).to eql(5 + 10 + 15 + 20 + 2)
  end

  it 'returns the final accumulated value after each element is processed by the block' do
    expect(input.my_inject { |product, n| product * n }).to eql(5 * 10 * 15 * 20)
  end

  it 'returns the final accumulated value if only a symbol is given' do
    expect(input.my_inject(:+)).to eql(5 + 10 + 15 + 20)
  end

  it 'returns the longest word' do
    expect(input_str.my_inject { |memo, word| memo.length > word.length ? memo : word }).to eql('slide')
  end
end
