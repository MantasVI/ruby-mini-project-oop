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

#
##
# --- numbers ---
# 1.1 Select the even numbers.                  expected: [4, 22, 30]

p(numbers.select { |number| number.even? })

# 1.2 Select the numbers greater than 10.       expected: [15, 22, 30]
p(numbers.select { |number| number > 10 })
# 1.3 Select the odd numbers under 10.          expected: [9, 7, 3]
p(numbers.select { |number| number.odd? && number < 10 })
# --- words ---
# 1.4 Select the words longer than 4 letters.   expected: ["apple", "banana", "cherry"]
p(words.select { |word| word.length > 4 })
# 1.5 Select the words containing the letter a. expected: ["apple", "banana"]
p(words.select { |word| word.include?('a') })
# 1.6 Select the words ending in y.             expected: ["cherry"]
p(words.select { |word| word.end_with?('y') })
# --- nested arrays ---
# 1.7 Select the inner arrays with more than one item.
#                                               expected: [[1, 2], [3, 4, 5]]
p(nested.select { |value| value.length > 1 })
# 1.8 Select the inner arrays whose sum is greater than 5.
#                                               expected: [[3, 4, 5], [6]]
p(nested.select { |value| value.sum > 5 })
# --- people ---
# 1.9  Select the people who are 18 or older.   expected: Anna, Mia and Leo (as hashes)
p(people.select { |person| person[:age] >= 18 })
# 1.10 Select the people who live in Vilnius.   expected: Anna and Mia
p(people.select { |person| person[:city] == 'Vilnius' })
# 1.11 Select the people whose name is longer than 3 letters.
#                                               expected: Anna and Tomas
p(people.select { |person| person[:name].length > 3 })
# --- scores (a hash) ---
# 1.12 Select the pairs with a score of 70 or more.
#                                               expected: {"anna"=>80, "mia"=>92, "leo"=>70}
p(scores.select { |name, score| score >= 70 })
# 1.13 Select the pairs whose name starts with m.
#                                               expected: {"mia"=>92}
p(scores.select { |name, score| name.start_with?('m') })
