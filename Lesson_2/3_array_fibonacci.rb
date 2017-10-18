array = [0,1]
array.each_index do |i|
  x = array[i] + array[i+1]
  break if x > 100
  array << x
end
puts array
