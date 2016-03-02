require './mathlibs/discrete_math'

# Using rules derived from Chinese Remainder Theorom, Solve a System of congruences
# See, Chinese Remainder Theorem section 3.7 Rosen.

puts "\nHow many congruencies of a system?\n"
number_of_congruencies = gets.to_i
i=0
systems = Array.new
product_of_m = 1
while number_of_congruencies > i
  # get each b and m for the form x == b (mod m)
  puts "Wht is the integer b : x == b(mod m)?\n"
  b = gets.to_i

  puts "Wht is the integer m : x == #{b}(mod m)?\n"
  m = gets.to_i

  product_of_m *=m
  congruence = Congruence.new(b, m)
  systems.push(congruence)
  i+=1
end

# TODO: need ot check if all m are relativily prime

# Perform a simultaneous solution
discMath = DiscreteMath.new()
steps = Array.new
step_count = 1
x = 0
systems.each do |c|
  s, t = discMath.extended_gcd(product_of_m/c.m, c.m)
  
  k = 1
  while s < 0
    s = s + (c.m * k)
    k += 1
  end
  
  step = SolutionStep.new(product_of_m/c.m, s, c.b)
  steps.push(step)
  puts "step#{step_count}: m is #{product_of_m/c.m}, s is #{s}, a is #{c.b}\n"
  step_count += 1
  x += step.product
end

b = x % product_of_m
puts "\n#{x} == b (mod #{product_of_m})\n"
puts "Therefore, #{b} + #{product_of_m}*k = x, where k is any integer."