class MyPrime
  def self.first(length)
    primes = []
    i = 0
    n = 2
    while length > i
      if next_prime?(n, primes)
        primes << n
        i+=1
      end
      n+=1
    end
    primes
  end

  private

  def self.next_prime?(candidate, primes)
    primes.reject { |n| n > Math::sqrt(candidate) }.each do |prime|
      return false if candidate.modulo(prime) == 0
    end
    return true
  end
end
