puts "Введите коэффициент а:"
a = gets.chomp
puts "Введите коэффициент b:"
b = gets.chomp
puts "Введите коэффициент c:"
c = gets.chomp
d = b.to_f**2 - 4 * a.to_f * c.to_f
if d > 0
	puts "Дискриминант = #{d}"
	puts "X1 = #{(Math.sqrt(d) - b.to_f)/(2 * a.to_f)}"
	puts "X2 = #{(-Math.sqrt(d) - b.to_f)/(2 * a.to_f)}"
elsif d == 0
	puts "Дискриминант = #{d}"
	puts "X1 = X2 = #{(Math.sqrt(d) - b.to_f)/(2 * a.to_f)}"
else 
	puts "Дискриминант = #{d}"
	puts "Корней нет"
end   
