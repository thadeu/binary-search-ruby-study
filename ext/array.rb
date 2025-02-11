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
