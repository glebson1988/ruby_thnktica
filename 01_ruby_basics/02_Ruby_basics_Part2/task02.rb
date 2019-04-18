puts "Программа 'Заполнение массива от 10 до 100 с шагом 5'."
puts '=' * 80


arr = (10..100).each.with_object([]) { |num, ar| ar << num if num % 5 == 0 }
puts arr
