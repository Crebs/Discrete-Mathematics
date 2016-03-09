require './mathlibs/discrete_math'

# Performs Modular Exponentiation (b^n mod m)
discMath = DiscreteMath.new()
a = discMath.baseExpansionOf(2, 13)
# discMath.modularExponentiation(3, a, 645)
discMath.strait_math_of_b_to_the_nth_power_mod_m(1819,discMath.decimalExpansionOf(a),2537)