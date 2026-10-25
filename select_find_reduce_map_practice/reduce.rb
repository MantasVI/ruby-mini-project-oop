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
# PART 4: REDUCE (boil it down to one value)
# Check three things when it fails: the start value, two block parameters,
# and the last line of the block returning the running value.
# ==========================================================================

# --- numbers ---
# 4.1 Reduce to the sum of all numbers.         expected: 90
p(numbers.reduce { |sum, value| sum += value })
# 4.2 Reduce to the biggest number, without using max. expected: 30
p(numbers.reduce(0) do |biggest, value|
  biggest < value ? value : biggest
end)
# 4.3 Reduce to a count of how many numbers are even.  expected: 3
p(numbers.reduce(0) do |count, value|
  value.even? ? count += 1 : count
end)
# 4.4 Reduce to the sum of only the even numbers.      expected: 56
p(numbers.reduce(0) do |sum, value|
  value.even? ? sum += value : sum
end)
# --- words ---
# 4.5 Reduce to the total number of letters in all words. expected: 24

p(words.reduce(0) { |sum, word| sum += word.length })

# 4.6 Reduce to the longest word (keep the first on a tie). expected: "banana"
p(words.reduce('apple') { |sum, word|  sum.length < word.length ? sum = word : sum })

# 4.7 Reduce to one sentence with spaces between words, without using join.
#                                               expected: "apple kiwi banana fig cherry"
p(words.reduce { |sum, word| sum += " #{word}" })
# 4.8 Reduce to a hash of word => length.
#                                               expected: {"apple"=>5, "kiwi"=>4, "banana"=>6, "fig"=>3, "cherry"=>6}
# p(words.reduce({}) { |sum, word| sum[word] = word.length })
# --- nested arrays ---
# 4.9  Reduce to the total of every number inside every inner array. expected: 21
p nested.reduce(0) { |sum, val| sum += val.sum }
# 4.10 Reduce to one flat array of all numbers
#  expected: [1, 2, 3, 4, 5, 6]
p(nested.reduce { |arr, val| arr.push(val).flatten })
# 4.11 Reduce to the count of all items inside all inner arrays. expected: 6
p(nested.reduce(0) { |count, items| count + items.length })
# --- people ---
# 4.12 Reduce to the sum of all ages.           expected: 115
p(people.reduce(0) { |sum, val| sum + val[:age] })
# 4.13 people per city
p(people.each_with_object({}) do |person, result|
  result[person[:city]] = result.fetch(person[:city], 0) + 1
end)

# 4.14 name => age
p(people.each_with_object({}) do |person, result|
  result[person[:name]] = person[:age]
end)

# 4.15 the oldest person
p(people.reduce { |oldest, person| person[:age] > oldest[:age] ? person : oldest })

# 4.16 total of all scores
p(scores.reduce(0) { |total, (name, score)| total + score })

# 4.17 name with the highest score
p(scores.reduce(scores.first) { |best, (name, score)| score > best[1] ? [name, score] : best }.first)

# 4.18 every score + 5
p(scores.each_with_object({}) do |(name, score), result|
  result[name] = score + 5
end)
