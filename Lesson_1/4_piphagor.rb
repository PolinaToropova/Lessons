puts "Введите первую сторону треугольника:"
x1 = gets.chomp.to_f
puts "Введите вторую сторону треугольника:"
x2 = gets.chomp.to_f
puts "Введите третью сторону треугольника:"
x3 = gets.chomp.to_f
if x1 == x2 || x1 == x3 || x3 == x2
  puts "Треугольник равнобедренный"
  end
if x1 == x2 && x2 == x3 && x1 == x3
  puts "Треугольник равносторонний"
end
a = x1
b = x2
c = x3
if x1 > x2 && x1 >x3
  c = x1
  a = x2
  b = x3
elsif x2 > x1 && x2 > x3
  c = x2
  a = x1
  b = x3  
else x3 > x1 && x3 >x2
  c = x3
  a = x2
  b = x1
end
c2 = c**2
s2 = a**2 + b**2
if c2 == s2
  puts "Треугольник прямоугольный"
else
  puts "Треугольник не прямоугольный"
end
