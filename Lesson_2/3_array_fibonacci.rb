array = [0,1]
i = 0
for i in (0..9) do
  x = array[i] + array[i+1]
  array.push(x)
end
puts array
