puts "Программа 'Идеальный вес'."
puts '=' * 80

puts 'Введите своe имя: '
name = gets.capitalize.chomp

puts 'Введите свой рост в сантиметрах: '
height = gets.to_i

weight = height - 110

if weight < 0
  puts 'Ваш вес уже оптимальный.'
else
  puts "#{name}, ваш идеальный вес: #{weight}."
end
