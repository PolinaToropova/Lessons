month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
puts "Введите год: "
y = gets.chomp.to_i
puts "Введите месяц (от 1 до 12): "
m = gets.chomp.to_i
puts "Введите число (от 1 до 31): "
d = gets.chomp.to_i
month[1] = 29 if y%400 == 0 || (y%4 == 0 && y%100 != 0)
m -= 1
s = 0
i = 0
while i < m do
  s += month[i]
  i += 1
end
puts "Порядковый номер даты: #{s + d}"
