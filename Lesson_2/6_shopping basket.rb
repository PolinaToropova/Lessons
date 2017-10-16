h1 = {}
array = []
fin = 0
loop do
  puts "Введите наименование товара: "
  a = gets.chomp
  break if a == 'стоп'
  puts "Введите цену за ед. товара: "
  b = gets.chomp.to_f
  puts "Введите количество товара: "
  c = gets.chomp.to_f
  h2 = Hash.new
  h2[b] = c
  h1[a] = h2
end
puts h1
h1.each {|name, amt|
  puts "\nИтого товар \"#{name}\" на сумму:"
  amt.each {|price, qt|
    s = price * qt
    puts "#{s} руб."
    array.push(s) 
} 
} 
array.each {|s|
  fin = fin + s
}
puts "\nСумма всех покупок: #{fin} руб."
