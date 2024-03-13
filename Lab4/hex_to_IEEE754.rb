def get_hex()
  puts "Input a hex number: "
  hex_num = gets.chomp!

  unless hex_num =~ /[a-fA-F0-9]{8}/
    puts "Format: 00000000"
    hex_num = get_hex()
  end

  return hex_num
end

def split_fp(bin)
  sign = bin[0]
  expo = bin[1..8]
  mant = bin[9..31]
  return [sign, expo, mant]
end

def display_fp(bin_arr)
  puts "\tDEC\t\tBIN"
  puts "Sign:\t#{bin_arr[0].to_i(2)}\t\t#{bin_arr[0]}"
  puts "Expo:\t#{bin_arr[1].to_i(2)}\t\t#{bin_arr[1]}"
  puts "Mant:\t#{bin_arr[2].to_i(2)}\t\t#{bin_arr[2]}"
  puts
end

hexes = ['7f7fffff', '10000000', '7f7f0000', '7f800000']

hexes.each do |hex_num|
  puts "#{hex_num}-----------------------------------"
  bin = hex_num.hex.to_s(2).rjust(hex_num.size*4, '0')
  bin_arr = split_fp(bin)
  display_fp(bin_arr)
end
