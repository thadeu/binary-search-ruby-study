require 'bundler/inline'

require_relative 'ext/array'
require_relative 'lib/linear_search'
require_relative 'lib/binary_search'

gemfile do
  source 'https://rubygems.org'

  gem 'json', require: true
  gem 'benchmark', require: true
  gem 'benchmark-ips'
end

arr = (0..1000).to_a

targeted_values = [250, 480, 500]

Benchmark.ips do |x|
  x.config(warmup: 0, time: 1)

  x.report('LinearSearch.search') do
    targeted_values.each do |value|
      LinearSearch.search(arr, value)
    end
  end

  x.report('LinearSearch.linear_search') do
    targeted_values.each do |value|
      LinearSearch.linear_search(arr, value)
    end
  end

  x.report('BinarySearch.search') do
    targeted_values.each do |value|
      BinarySearch.search(arr, value)
    end
  end

  x.report('BinarySearch.bsearch') do
    targeted_values.each do |value|
      BinarySearch.bsearch(arr, value)
    end
  end

  x.report('[native] Array#bsearch') do
    targeted_values.each do |value|
      arr.bsearch { value <=> it }
    end
  end

  x.compare!
end
