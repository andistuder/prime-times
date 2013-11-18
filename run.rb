load 'lib/product_table.rb'
load 'lib/my_prime.rb'

prime_numbers = MyPrime.first(10)
puts ProductTable.generate_table(prime_numbers,prime_numbers).decorate
