
chain = 
{
  a: {a: 0.4, b: 0.6},
  b: {a: 0.2, b: 0.8}
}


length = 20

out = []
out << chain.keys.sample

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

puts out.join("")

