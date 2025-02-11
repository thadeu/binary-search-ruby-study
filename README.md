# Study for Binary Search algorithm.

I created a benchmark to compare the performance of the binary search and linear search algorithms in Ruby.


```rb
Calculating -------------------------------------
LinearSearch.each_with_index
                         15.308k (± 4.8%) i/s   (65.32 μs/i) -     15.183k in   0.996950s
LinearSearch.while_search
                         24.312k (± 4.0%) i/s   (41.13 μs/i) -     24.141k in   0.995151s
 BinarySearch.search    614.769k (±34.4%) i/s    (1.63 μs/i) -    506.354k in   0.903373s
       Array#bsearch    999.366k (± 2.3%) i/s    (1.00 μs/i) -    811.524k in   0.817148s
 Array#binary_search    632.127k (±35.0%) i/s    (1.58 μs/i) -    515.895k in   0.901586s

Comparison:
       Array#bsearch:   999365.7 i/s
 Array#binary_search:   632126.7 i/s - 1.58x  slower
 BinarySearch.search:   614768.9 i/s - 1.63x  slower
LinearSearch.while_search:    24311.6 i/s - 41.11x  slower
LinearSearch.each_with_index:    15308.5 i/s - 65.28x  slower
```

So, after run my benchmar, I discover that Array#bsearch native method is so good and many fastest than my implementations.

`BinarySearch.search` have a little performance than other implementations, using recursive algorithm and mid, high navigation, improve performance to search value in the tree.