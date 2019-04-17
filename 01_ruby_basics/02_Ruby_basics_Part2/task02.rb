puts "Программа 'Заполнение массива от 10 до 100 с шагом 5'."
puts '=' * 80

arr = []
(10..100).each { |num| arr << num if num % 5 == 0 }
puts arr
