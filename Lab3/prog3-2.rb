def recursive_function(n)
  return 1 if n == 1
  return recursive_function(n-1) + 2*n - 1
end

print "n\ta_n\n"
10.times do |i|
  print "#{(i+1)*10}:\t#{recursive_function((i+1)*10)}\n"
end
