require './lib/enigma'

original_message = File.open(ARGV[0], "r")
message_destination = File.open(ARGV[1], "w")
message = original_message.read.strip
enigma = Enigma.new
encrypted = enigma.encrypt(message)
message_destination.write(encrypted[:encryption])

puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}."
