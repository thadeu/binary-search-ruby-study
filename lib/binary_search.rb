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
