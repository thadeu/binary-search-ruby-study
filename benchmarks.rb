require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'

  gem 'json', require: true
  gem 'benchmark', require: true
  gem 'benchmark-ips'
end

class LinearSearch
  def self.each_with_index(arr, target)
    arr.each_with_index do |num, index|
      return index if num == target
    end

    nil
  end

  def self.while_search(arr, target)
    i = 0

    while i < arr.length
      if arr[i] == target
        return i
      end

      i += 1
    end

    "not found"
  end
end

class BinarySearch
  def self.search(arr, target_value, low = 0, high = nil)
    high ||= arr.size - 1
    mid = (low + high) / 2

    return 0 if low > high

    if arr[mid] == target_value
      return mid
    elsif target_value > arr[mid]
      search(arr, target_value, mid + 1, high)
    else
      search(arr, target_value, low, mid - 1)
    end
  end
end

class Array
  def binary_search(target_value, low = 0, high = nil)
    high ||= size - 1
    mid = (low + high) / 2

    return 0 if low > high

    if self[mid] == target_value
      return mid
    elsif target_value > self[mid]
      binary_search(target_value, mid + 1, high)
    else
      binary_search(target_value, low, mid - 1)
    end
  end
end

arr = (0..1000).to_a

targeted_values = [250, 480, 500]

Benchmark.ips do |x|
  x.config(warmup: 0, time: 1)

  x.report('LinearSearch.each_with_index') do
    targeted_values.each do |value|
      LinearSearch.each_with_index(arr, value)
    end
  end

  x.report('LinearSearch.while_search') do
    targeted_values.each do |value|
      LinearSearch.while_search(arr, value)
    end
  end

  x.report('BinarySearch.search') do
    targeted_values.each do |value|
      BinarySearch.search(arr, value)
    end
  end

  x.report('Array#bsearch') do
    targeted_values.each do |value|
      arr.bsearch { value <=> it }
    end
  end

  x.report('Array#binary_search') do
    targeted_values.each do |value|
      arr.binary_search(value)
    end
  end

  x.compare!
end
