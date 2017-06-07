require 'pry'
chain = 
{
  sunny: {rainy: 0.05, cloudy: 0.25, sunny: 0.7},
  cloudy: {sunny: 0.2, rainy: 0.3, cloudy: 0.5},
  rainy: {sunny: 0.2, cloudy: 0.2, rainy: 0.6}
}

length = 14

out = []
out << chain.keys.sample
byebug
length.times do 
  acc = 0.0 
  r = rand
  current = chain[out.last]
  current.each do |ch, val|
    acc += val
    if r < acc
      out << ch
      break
    end
  end
end

puts out.join(" ")

