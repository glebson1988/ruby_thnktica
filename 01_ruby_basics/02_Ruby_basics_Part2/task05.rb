puts "Программа 'Определение порядкового номера даты в году'."
puts '=' * 80

puts 'Введите день месяца: '
day = gets.chomp.to_i

puts 'Введите месяц: '
month = gets.chomp.to_i

puts 'Введите год: '
year = gets.chomp.to_i

# определяем високосный год
leap_year = (year % 4).zero? && !(year % 100).zero? || (year % 400).zero?

months = {
  1 => 31,
  2 => leap_year ? 29 : 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31
}

puts day + (1...month).sum { |m| months[m] }
