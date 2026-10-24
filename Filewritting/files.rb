File.write('notes.txt', "hello \nsecond line\n")
File.write('notes.txt', "hello \n3rd line\n", mode: 'a')
text = File.read('notes.txt')
puts text

lines = File.readlines('notes.txt', chomp: true)
puts lines

File.foreach('notes.txt') do |line|
  puts line
end
if File.exist?('notes.txt')
  puts File.read('notes.txt')
else
  puts 'no file'
end
File.delete('notes.txt')

File.open('notes.html', '') do |file|
  file.write("\n haha")
end
