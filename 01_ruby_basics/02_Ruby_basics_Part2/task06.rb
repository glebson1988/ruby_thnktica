puts "Программа 'Сумма покупок'."
puts '=' * 80

goods = {}
item_sum = {}
total = 0

loop do
  puts 'Название товара: '
  item = gets.chomp

  break if item == 'стоп'

  puts 'Цена за единицу: '
  price = gets.chomp.to_f

  puts 'Количество товара: '
  quant = gets.chomp.to_f

  goods[item] = { price: price, quantity: quant }
  total += item_sum[item] = price * quant
end

puts "Хеш: #{goods}."

# итоговая сумма за каждый товар
item_sum.each { |item, sum| puts "Товар: #{item}, сумма: #{sum}." }

# итоговая сумма всех покупок
puts "Сумма покупок: #{total}."
