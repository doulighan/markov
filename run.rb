require_relative 'markov.rb'


tolkien = File.open("tolkien.txt", "rb").read.to_s
tolkien.sub! ',', ""
proust = File.open("proust.txt", "rb").read.to_s

word = true
run(proust, 150, word)
