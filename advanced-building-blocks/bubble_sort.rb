def bubble_sort(arr)
  n = arr.length
  begin
    swapped = false
    for i in 1...n
      if arr[i-1] > arr[i]
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true
      end
    end
  end until swapped == false
  print "#{arr} \n"
end

def bubble_sort_by(arr)
  n = arr.length
  begin
    swapped = false
    for i in 1...n
      if yield(arr[i-1], arr[i]) > 0
        arr[i-1], arr[i] = arr[i], arr[i-1]
        swapped = true
      end
    end
  end until swapped == false
  print "#{arr} \n"
end

bubble_sort([4,3,78,2,0,2])

bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end