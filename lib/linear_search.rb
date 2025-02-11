class LinearSearch
  def self.search(arr, target)
    arr.each_with_index do |num, index|
      return index if num == target
    end

    nil
  end

  def self.linear_search(arr, target)
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
