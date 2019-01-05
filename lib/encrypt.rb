require './lib/enigma'

file_1 = File.open(ARGV[0], "r")
file_2 = File.open(ARGV[1], "w")
message = file_1.read.strip
enigma = Enigma.new
encrypted = enigma.encrypt(message)
file_2.write(encrypted[:encryption])
puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}."
