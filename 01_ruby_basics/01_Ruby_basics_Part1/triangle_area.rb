puts "Программа 'Площадь треугольника'."
puts '=' * 80

puts 'Введите длину основания треугольника: '
a = gets.to_f

puts 'Введите высоту треугольника: '
h = gets.to_f

area = a * h * 0.5
puts "Площадь треугольника равна: #{area}."
