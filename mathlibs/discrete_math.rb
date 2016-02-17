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
end