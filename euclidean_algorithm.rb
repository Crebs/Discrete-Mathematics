require './mathlibs/discrete_math'

puts "Using the Euclidean Algorithm we can find the greatest common divisor of two integers efficiently.\n"
puts "Enter two integers, enter the largest first.\n"

# Loop forever
while 1
  # Get two integers from user.
  puts "\nWhat is the first integer?\n"
  a = gets.to_i

  puts "What is the second value?\n"
  b = gets.to_i

  # Swap values if needed
  if a < b
    temp = a
    a = b
    b = temp
  end

  # Compute gcd with euclidean algorithm
  discMath = DiscreteMath.new()
  result = discMath.gcd(a, b)
  puts "\ngcd of #{a} and #{b} is #{result}\n"
  
  # Compute extended euclidean algorithm
  s, t = discMath.extended_gcd(a, b)
  puts "\nUsing Extented Euclidean algorithm to find the linear combination of #{a} and #{b}\n"
  puts "***[in Bézout's Identity s*a + t*b = gcd(a,b)]***\n"
  puts "#{s}*#{a} + #{t}*#{b} = gcd(#{a},#{b}) = #{result}\n"
  puts "where s is #{s} and t is #{t}"
end