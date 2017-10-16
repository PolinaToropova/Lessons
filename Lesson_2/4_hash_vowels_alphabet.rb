h={}
arr2 = ['A', 'E', 'I', 'O', 'U', 'W', 'Y']
arr2.each_index { |j| 
  arr1 = ('A'..'Z').to_a
  arr1.each_index { |i|
    h[arr2.at(j)] = i+1 if arr1.at(i) == arr2.at(j)
}  
}
puts h
