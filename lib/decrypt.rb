require './lib/enigma'

encrypted_message = File.open(ARGV[0], "r")
message_destination = File.open(ARGV[1], "w")
key = "#{ARGV[2]}"
date = "#{ARGV[3]}"
message = encrypted_message.read.strip
enigma = Enigma.new
decrypted = enigma.decrypt(message, key, date)
message_destination.write(decrypted[:decryption])

puts "Created #{ARGV[1]} with the key #{key} and date #{date}."
