# Task description
# This is a demo task.

# Write a function:

# def solution(a)

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

# N is an integer within the range [1..100,000];
# each element of array A is an integer within the range [−1,000,000..1,000,000].


def solution1(a)
  smallest = 0

  (1..1000000).each do |num|
    if !a.include?(num)
      smallest = num
      break
    end
  end

  smallest
end

def solution2(a)
  sorted_uniq = a.push(0).uniq.sort
  zero_idx = sorted_uniq.index(0)
  positive_arr = sorted_uniq[zero_idx+1..-1]
  
  (1..1000000).each do |num|
    if !positive_arr.include?(num)
      return num
    end
  end
end

def solution3(a)
  sorted_uniq = a.push(0).uniq.sort
  zero_idx = sorted_uniq.index(0)
  positive_arr = sorted_uniq[zero_idx+1..-1]
  
  for int in 1..positive_arr.length
    puts positive_arr[int - 1]
    return int if int != positive_arr[int - 1]
  end

  positive_arr.length + 1
end