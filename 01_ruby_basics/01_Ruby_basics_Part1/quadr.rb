puts "Программа 'Квадратное уравнение'."
puts '=' * 80

puts 'Введите первый коэффициент: '
a = gets.to_i

puts 'Введите второй коэффициент: '
b = gets.to_i

puts 'Введите третий коэффициент: '
c = gets.to_i

# вычисляем дискриминант:
d = (b ** 2) - (4 * a * c)

# выводим результат, в зависимости от ввода юзера и вычислений
if d < 0
  puts "Дискриминант: #{d}. Корней нет."
elsif d == 0
  x = (- b) / (2 * a)
  puts "Дискриминант: #{d}. Корень: #{x}"
elsif d > 0
  x1 = (-b + Math.sqrt(d)) / (2 * a)
  x2 = (-b - Math.sqrt(d)) / (2 * a)
  puts "Дискриминант: #{d}. Первый корень: #{x1}, второй корень: #{x2}"
end