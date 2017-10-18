h={}
arr2 = ['A', 'E', 'I', 'O', 'U', 'W', 'Y']
arr1 = ('A'..'Z').to_a
arr1.each_with_index do |letter, index|
  h[letter] = index + 1 if arr2.include?(letter)
end 
puts h
