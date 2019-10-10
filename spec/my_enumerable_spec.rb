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
