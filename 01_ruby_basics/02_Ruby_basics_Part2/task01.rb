puts "Программа 'Количество дней в месяце'."
puts '=' * 80

months = {
  'Jan' => 31,
  'Feb' => 28,
  'Mar' => 31,
  'Apr' => 30,
  'May' => 31,
  'Jun' => 30,
  'Jul' => 31,
  'Aug' => 31,
  'Sep' => 30,
  'Oct' => 31,
  'Nov' => 30,
  'Dec' => 31
}

months.each { |month, day| puts month if day == 30 }
