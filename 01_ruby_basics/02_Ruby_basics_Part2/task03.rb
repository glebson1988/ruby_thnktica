puts "Программа 'Заполнение массива числами Фибоначчи'."
puts '=' * 80

fib = [1]
num = 1

while num <= 100 do
  fib << num
  num = fib[-2] + fib[-1]
end

puts fib
