puts "Введите, пожалуйста, своё имя:"
name = gets.chomp
puts "Введите, пожалуйста, свой рост в сантиметрах:"
weight = gets.chomp.to_i
p = weight-110
if p > 0
  puts "Ваш, #{name}, идеальный вес = #{p} кг"
else 
  puts "Ваш вес уже идеальный"
end  
