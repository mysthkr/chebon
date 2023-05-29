class NoCountryError < StandardError
end
def currency_of(country)
  countries = {japan: 'yen', us: 'dollar'}
  # 正しい国名が見つかると、通貨を返す
  if countries.has_key?(country)
    puts "#{countries[country]}"
  end
end 

puts "-------------"
puts "japanを指定します"
currency_of(:japan)
puts "-------------"
puts "italyを指定します"
currency_of(:italy)
