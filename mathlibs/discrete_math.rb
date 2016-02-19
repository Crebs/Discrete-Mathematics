#!/usr/bin/ruby


# Class to perform Discrete Math Algorithms I'm learning from my personal study.
# These Algorthims are for study purposes only.  Some methods may have 
# vulerabilities and other issues.
class DiscreteMath
  # Function to perform Modular Exponentiation from the form b^n mod m (see Rosen)
  def modularExponentiation(b, n, m) # O((log m)^2 log n)
    print "*** Modular Exponentiation of (b^n mod m) ***\n"
    x = 1
    power = b % m
    i = 0
    while i < n.count
      if n[i] == 1
        # print "#{x} = (#{x} * #{power}) mod #{m}\n"
        x = (x * power) % m
        # print "#{x}"
      end
      power = (power * power) % m
      print "i=#{i} n_#{i}=#{n[i]} x=#{x} power=#{power}\n"
      i += 1
    end
    print "b^n mod M = #{x} = #{b}^#{self.decimalExpansionOf(n)} mod #{m}\n"
  end
  
  # Function to perform Decimal Expansion of 'n' (see Rosen)
  # param n Is an array reprsenting a base 2 number of the form (a_k-1 ..... a_0 a_1)_2
  # return Decimal value of base 10
  def decimalExpansionOf(n)
    i = 0
    expansion = 0
    while i < n.count
        expansion += (n[i] * 2 ** i)
      i+= 1
    end
    return expansion
  end
  
  # method to just run strait math WITHOUT performing Modular Exponentiation (see Rosen, it says this isn't efficient when n,b, and m are large, I don't understand the details of why thi is less efficient than the above Modular Exponentiation function above)
  def strait_math_of_b_to_the_nth_power_mod_m(b, n, m)
    print "\n*** Strait Math of b^n mod m ***\nb^n mod M = #{(b**n) % m} = #{b}^#{n} mod #{m}\n"
  end
  
  # When 'n' is a base 10 number we can find a number of given 'base'
  # @param base Base value to expand to. Examples: base 2 - binary, base 16 Hexadecimal, base 8 Octal
  # @param n Decimal to expand the base to
  # @return Array representing base expanstion in the form (a_0 a_1 .... a_k-1)_base
  def baseExpansionOf(base, n)
    return self.recursiveBaseExpansionOf(base,n,Array.new)
  end
  
  # A recursive Function to obtain then base expanstion of n (when n is a decimal)
  # @param base Base value to expand to. Examples: base 2 - binary, base 16 Hexadecimal, base 8 Octal
  # @param n Decimal to expand the base to
  # @param a An array to fill with the expantions (this will be filled by the recursive call make sure this an empty array)
  def recursiveBaseExpansionOf(base, n, a)
    if n != 0
      q = (n/base).floor
      recursiveBaseExpansionOf(base, q, a << n - (q * base))
    else 
      return a
    end
  end
  
  # Euclidean algorithm (name after Euclid, Greek Mathematician from his book the Elements) for finding the greatest common divisor of two integers.  
  # Argude to be one of the most useful algorithms and possibly one of the oldest. (For more information see Rosen Section 3.6 start @ pg 226.) 
  # https://en.wikipedia.org/wiki/Euclid 
  # @param a Integer value to find gcd
  # @param b Integer value to find gcd
  # @return the gcd of the two integers  
  def gcd (a, b) # O(log b)
    if b != 0
      self.gcd(b, a % b)
    else
      return a
    end
  end
  
  #  origianl source from https://gist.github.com/gpfeiffer/4013925
  #  extended_gcd.rb
  #
  #  given non-negative integers a > b, compute
  #  coefficients s, t such that gcd(a, b) == s*a + t*b [aka Bézout's Identity]
  #  reference: https://en.wikipedia.org/wiki/Bézout%27s_identity
  #  Finding gcd(a, b) a linear combination of a and b 
  #  @param a Integer value to find linear combination of
  #  @param b Integer value to find linear combination of
  #  @return tuple of coefficients s, t for the Bézout's Identity s*a + tb
  #
  # Example table for gcd(252, 198) = 18 as a linear combination of 252 and 198
  #  Stack   a  , b  , q, r , s , t , returned tuple (t, s - q * t)
  #  0       252  198  1  54  -   -   -
  #  1       198  54   3  36  -   -   -
  #  2       54   36   1  18  -   -   -
  #  3       36   18   2  0   -   -   -
  #  4       18   0    -  -   -   -   (1 , 0)                              18 = 18
  #  3       36   18   2  0   1   0   (0 , 1 - 2*0 = 1)      => ( 0, 1 )   18 = 36*0   + 18*1
  #  2       54   36   1  18  0   1   (1 , 0 - 1 * 1 = -1)   => ( 1, -1)   18 = 54*1   + 36*-1
  #  1       198  54   3  36  1   -1  (-1, 1 - 3*-1 = 4)     => (-1, 4 )   18 = 198*-1 + 54*4
  #  0       252  198  1  54  -1  4   (4 ,  -1 - 1 * 4 = -5) => ( 4, -5)   18 = 252*4  + 198*-5
  #
  #  { this completes the solution in the form gcd(252, 198) = 18 = 4*252 + -5*198,
  #    where s is 4 and t is -5 }
  def extended_gcd(a, b)

    # trivial case first: gcd(a, 0) == 1*a + 0*0  
    return 1, 0 if b == 0

    # recurse: a = q*b + r
    q, r = a.divmod b
    s, t = extended_gcd(b, r)

    # compute and return coefficients:
    # gcd(a, b) == gcd(b, r) == s*b + t*r == s*b + t*(a - q*b)
    return t, s - q * t
  end
end