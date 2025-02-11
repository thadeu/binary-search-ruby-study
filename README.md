# Study for Binary Search algorithm.

I created a benchmark to compare the performance of the binary search and linear search algorithms in Ruby.

This is a simple implementation of the binary search algorithm in Ruby.

```rb
class BinarySearch
  def self.bsearch(arr, target_value)
    low = 0
    high = arr.size - 1

    while low <= high
      mid = (low + high) / 2

      if arr[mid] == target_value
        return mid
      elsif target_value > arr[mid]
        low = mid + 1
      else
        high = mid - 1
      end
    end

    return 0
  end
end
```

```bash
Calculating -------------------------------------
 LinearSearch.search          15.338k (± 4.2%) i/s   (65.20 μs/i) -     15.221k in   0.997098s
 LinearSearch.linear_search   24.463k (± 2.8%) i/s   (40.88 μs/i) -     24.320k in   0.995080s
 BinarySearch.search          614.120k (±34.2%) i/s    (1.63 μs/i) -    509.488k in   0.903576s
 BinarySearch.bsearch         823.586k (±29.0%) i/s    (1.21 μs/i) -    646.574k in   0.875338s
 [native] Array#bsearch       999.857k (± 1.0%) i/s    (1.00 μs/i) -    814.751k in   0.815340s

Comparison:
 [native] Array#bsearch:        999857.4 i/s
 BinarySearch.bsearch:          823585.7 i/s - same-ish: difference falls...
 BinarySearch.search:           614120.4 i/s - 1.63x  slower
 LinearSearch.linear_search:    24462.8 i/s - 40.87x  slower
 LinearSearch.search:           15338.0 i/s - 65.19x  slower
```

So, after run my benchmark, I discover that Array#bsearch native method is so good and many fastest than my implementations.

`BinarySearch.bsearch` have a little performance than other implementations, using recursive algorithm and mid, high navigation, improve performance to search value in the tree.