path = File.join(__dir__, 'server.log')

File.open(path, 'w') do |file|
  5_000.times do |i|
    lines = i + 1
    if lines % 500 == 0
      file.puts 'GARBAGE'
    elsif lines % 7 == 0
      file.puts '2026-10-25 WARNING user 17 slow response'
    elsif lines % 10 == 0
      file.puts '2026-10-25 ERROR user 17 EXCEPTION'
    else
      file.puts '2026-10-25 INFO user 17 logged in'
    end
  end
  3.times do |i|
    file.write(path, "this is a fake log #{i + 1} \n", mode: 'a')
  end
end
# lazy

count = Hash.new(0)
bad_input = []
File.foreach(path).lazy.first(1).each do |line|
  if line.include?('INFO')
    count['INFO'] += 1
  elsif line.include?('WARNING')
    count['WARNING'] += 1
  elsif line.include?('ERROR')
    count['ERROR'] += 1
  else
    bad_input.push(line)
  end
end

if File.exist?('Filewritting/problems.txt')
  File.delete('Filewritting/problems.txt')
else
  File.open('Filewritting/problems.txt', 'a') do |file|
    File.foreach(path).each_slice(1000).with_index(1) do |batch, number|
      problems = batch.select { |line| line.include?('WARNING') || line.include?('ERROR') }
      problems.each { |line| file.write(line) }
      puts "batch #{number}: #{problems.length} problems saved"
    end
  end

end
