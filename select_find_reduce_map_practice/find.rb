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
# PART 2: FIND (the first match, or nil)
# ==========================================================================

# --- numbers ---
# 2.1 Find the first number greater than 20.    expected: 22

numbers.find { |number| number > 20 }

# 2.2 Find the first odd number.                expected: 9

p(numbers.find { |number| number.odd? })
# 2.3 Find the first number divisible by 5.     expected: 15

p(numbers.find { |number| number % 5 == 0 })
# 2.4 Find the first number greater than 100.   expected: nil
p(numbers.find { |number| number > 100 })
# --- words ---
# 2.5 Find the first word with exactly 3 letters. expected: "fig"
p(words.find { |word| word.length == 3 })
# 2.6 Find the first word starting with b.        expected: "banana"
p(words.find { |word| word.include?('b') })
# 2.7 Find the first word containing z.           expected: nil
p(words.find { |word| word.include?('z') })
# --- nested arrays ---
# 2.8  Find the first inner array that includes 4.        expected: [3, 4, 5]
p(nested.find { |arr| arr.include?(4) })
# 2.9  Find the first inner array with exactly one item.  expected: [6]
p(nested.find { |arr| arr.include?(6) })
# 2.10 Find the first inner array that includes 9.        expected: nil
p(nested.find { |arr| arr.include?(9) })
# --- people ---
# 2.11 Find the first person from Kaunas.       expected: Tomas's hash
p(people.find { |person| person[:name] == 'Tomas' })
# 2.12 Find the first person older than 40.     expected: Mia's hash
p(people.find { |person| person[:age] > 40 })
# 2.13 Find the person named Zed.               expected: nil
p(people.find { |person| person[:name] == 'Zed' })
# --- scores ---
# 2.14 Find the first pair with a score above 90.   expected: ["mia", 92]
p(scores.find { |name, score| score > 90 })
# 2.15 Find the first pair whose name has 3 letters. expected: ["mia", 92]
p(scores.find { |name, score| name.length == 3 })
# 2.16 Find the first pair with a score below 50.    expected: nil
p(scores.find { |name, score| score < 50 })
