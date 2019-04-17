puts "Программа 'Заполнение хеша гласными буквами'."
puts '=' * 80

alphabet = 'a'..'z'
vowels = ['a', 'e', 'i', 'o', 'u']
result = {}

alphabet.each.with_index(1) { |item, index| result[index] = item if vowels.include?(item) }
puts result
