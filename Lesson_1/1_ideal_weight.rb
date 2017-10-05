puts "Введите, пожалуйста, своё имя:"
name = gets.chomp
puts "Введите, пожалуйста, свой рост в сантиметрах:"
weight = gets.chomp
p = weight.to_i-110
if p > 0
	puts "Ваш, #{name}, идеальный вес = #{p} кг"
else 
	puts "Ваш вес уже идеальный"
end  
