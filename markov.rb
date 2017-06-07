
def string_to_sorted_probability_hash(string, bool)
  bool ? text = string.split(" ") : text = string.split("")
  chars = {}
  text.each_with_index do |a, i|
    b = text[i+1]
    chars[a] ||= {}
    chars[a][b] ||= 1
    chars[a][b] += 1.0
  end

  # Normalize
  chars.each do |letter, keys|
    total = 0
    keys.each do |c, val|
      total += val
    end
    keys.each do |c, val|
      chars[letter][c] /= total
    end
  end

  # Sort by ascending probabillity
  sorted = {}
  chars.each do |letter, keys|  
    sorted[letter] = keys.sort_by{|c, val| val}
  end
  #return sorted hash
  sorted
end

def generate_markov_chain(sorted_hash, length, bool)
  out = []
  out << sorted_hash.keys.sample

  length.times do 
    keys = sorted_hash[out.last]
    acc = 0.0 
    r = rand
    keys.each do |ch, val|
      acc += val
      if r < acc
        out << ch
        break
      end
    end
  end
bool ? out.join(" ") : out.join("")
end

def run(string, length, bool)
  sorted = string_to_sorted_probability_hash(string, bool)
  result = generate_markov_chain(sorted, length, bool)
  puts result
end

