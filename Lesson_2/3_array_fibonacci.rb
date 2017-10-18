array = []
x = 0
y = 1
while x < 100 do
array << x << y
x += y
y += x  
end
puts array
