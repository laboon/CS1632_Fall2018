raise "Enter a string." unless ARGV.count >= 1
puts (ARGV.join(" ").unpack('U*').map { |x| (x ** 10) + (x ** 8) - (x ** 3 + (x ** 2)) }.reduce(:+) % 65536).to_s(16)
