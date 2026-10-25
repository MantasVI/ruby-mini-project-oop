numbers = [4, 9, 15, 22, 7, 30, 3]
words   = %w[apple kiwi banana fig cherry]
nested  = [[1, 2], [3, 4, 5], [6]]
people  = [
  { name: 'Anna',  age: 31, city: 'Vilnius' },
  { name: 'Tomas', age: 17, city: 'Kaunas' },
  { name: 'Mia',   age: 45, city: 'Vilnius' },
  { name: 'Leo',   age: 22, city: 'Klaipeda' }
]
scores = { 'anna' => 80, 'tomas' => 55, 'mia' => 92, 'leo' => 70 }

# ==========================================================================
# PART 3: MAP (change every item)
# ==========================================================================

# --- numbers ---
# 3.1 Double every number.                      expected: [8, 18, 30, 44, 14, 60, 6]
p(numbers.map { |num| num * 2 })

# 3.2 Square every number.                      expected: [16, 81, 225, 484, 49, 900, 9]
p(numbers.map { |num| num**2 })
# 3.3 Turn each number into true or false for "is it even".
#                                               expected: [true, false, false, true, false, true, false]
p(numbers.map { |num| num.even? })
# 3.4 Turn each number into the word "even" or "odd".
#                                               expected: ["even", "odd", "odd", "even", "odd", "even", "odd"]
p(numbers.map do |num|
  if num.even?
    'even'
  else
    'odd'
  end
end)
# 3.5 Subtract 10 from each number, then take the absolute value.
#                                               expected: [6, 1, 5, 12, 3, 20, 7]
p(numbers.map { |num| (num - 10).abs })
# --- words ---
# 3.6  Make every word uppercase.               expected: ["APPLE", "KIWI", "BANANA", "FIG", "CHERRY"]
p(words.map { |word| word.upcase })
# 3.7  Turn each word into its length.          expected: [5, 4, 6, 3, 6]
p(words.map { |word| word.length })
# 3.8  Turn each word into its first letter.    expected: ["a", "k", "b", "f", "c"]
p(words.map { |word| word[0] })
# 3.9  Reverse every word.                      expected: ["elppa", "iwik", "ananab", "gif", "yrrehc"]
p(words.map { |word| word.reverse })
# 3.10 Turn each word into "word:length".       expected: ["apple:5", "kiwi:4", "banana:6", "fig:3", "cherry:6"]
p(words.map { |word| "#{word}: #{word.length}" })
# 3.11 Capitalize every word and add an exclamation mark.
#                                               expected: ["Apple!", "Kiwi!", "Banana!", "Fig!", "Cherry!"]
p(words.map { |word| "#{word.capitalize}!" })
# --- nested arrays ---
# 3.12 Turn each inner array into its length.   expected: [2, 3, 1]
p(nested.map { |arr| arr.length })
# 3.13 Turn each inner array into its sum.      expected: [3, 12, 6]
p(nested.map { |arr| arr.sum })
# 3.14 Turn each inner array into its first item. expected: [1, 3, 6]
p(nested.map { |arr| arr.first })
# 3.15 Turn each inner array into its biggest item. expected: [2, 5, 6]
p(nested.map { |arr| arr.max })
# 3.16 Double every number inside every inner array, keeping the nesting.
#      (a map inside a map)                     expected: [[2, 4], [6, 8, 10], [12]]
p(nested.map { |arr| arr.map { |val| val * 2 } })
# --- people ---
# 3.17 Get just the names.                      expected: ["Anna", "Tomas", "Mia", "Leo"]
p(people.map { |person| person[:name] })
# 3.18 Turn each person into text like "Anna (31)".
#                                               expected: ["Anna (31)", "Tomas (17)", "Mia (45)", "Leo (22)"]
p(people.map { |person| "#{person[:name]} (#{person[:age]}) " })
# 3.19 Get each person's age in 10 years.       expected: [41, 27, 55, 32]
p(people.map { |person| person[:age] + 10 })
# 3.20 Get the city names in uppercase.         expected: ["VILNIUS", "KAUNAS", "VILNIUS", "KLAIPEDA"]
p(people.map { |person| person[:city].upcase })
# 3.21 Turn each person into a new hash with only name and adult (true if 18+).
#                                               expected: [{name: "Anna", adult: true}, {name: "Tomas", adult: false}, ...]
p(people.map { |person| { name: person[:name], adult: person[:age] >= 18 } })
# 3.22 Turn each person into a copy with age + 1 WITHOUT changing the originals.
#      Look up Hash#merge.
p x = people.map { |person| person.merge(age: person[:age] + 1) }
# --- scores (map on a hash gives an array) ---
# 3.23 Get an array of just the names.          expected: ["anna", "tomas", "mia", "leo"]
p(scores.map { |name, score| name })
# 3.24 Turn each pair into text like "anna: 80".
#                                               expected: ["anna: 80", "tomas: 55", "mia: 92", "leo: 70"]
p(scores.map { |name, score| "#{name}: #{score}" })
# 3.25 Get an array of each score minus 50.     expected: [30, 5, 42, 20]
p(scores.map { |name, score| score - 50 })
# 3.26 Turn each pair into [name.upcase, score], then add .to_h to get a hash back.
#                                               expected: {"ANNA"=>80, "TOMAS"=>55, "MIA"=>92, "LEO"=>70}
p(scores.map { |name, score| [name.upcase, score] }.to_h)
