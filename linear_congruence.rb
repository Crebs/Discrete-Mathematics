require './mathlibs/discrete_math'


puts "Determine if a \"Linear Congruence\" using Extended Euclidean Algorithm and Modulator Arithmetic.\n"
puts "Enter integers, to form the equation a*x == b(mod m).\n"

# Loop forever
while 1
  #Get the integers for the form a*x == b(mod m)
  puts "\nWhat is the integer a : a*x == b(mod m)?\n"
  a = gets.to_i

  puts "\nWhat is the integer b : #{a}*x == b(mod m)?\n"
  b = gets.to_i
  
  puts "\nWhat is the integer m : #{a}*x == #{b}(mod m)?\n"
  m = gets.to_i
  
  discMath = DiscreteMath.new()
  array = discMath.linear_congruence(a, b, m)
  
  puts "\n#{a}*x == #{b}(mod#{m}) finding integers for x.\n"
  puts "x = ...#{array}..."
end
