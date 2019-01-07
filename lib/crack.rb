require './lib/enigma'

encrypted_message = File.open(ARGV[0], "r")
message_destination = File.open(ARGV[1], "w")
date = "#{ARGV[2]}"
message = encrypted_message.read.strip
enigma = Enigma.new
cracked = enigma.crack(message, date)
decrypted = enigma.decrypt(message, cracked[:key], date)
message_destination.write(decrypted[:decryption])

puts "Created #{ARGV[1]} with the cracked key #{cracked[:key]} and date #{decrypted[:date]}."
