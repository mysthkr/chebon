#Action 1
def user_push_print_button(name)
  @name = name
end

#Action 2
def printer_request_to_server(name)
  filename = Time.now.strftime("%Y%m%d%H%M%S")
  @info = {name: name, filename: filename}
end

#Action 3
def server_make_file(info)
  case info[:name]
  when "Nishino"
    password = 8931
  when "Moe"
    password = 4649
  end
  file = File.new("#{info[:filename]}.txt", 'w')
  file.puts("name: #{info[:name]}")
  file.puts("password: #{password}")
  file.close
  @filename = info[:filename]
end

#Action 4
def server_send_file(file)
  @file = file
end

#Action 5
def printer_print_file
  
end

#Action 6
def user_get_file(file)
  File.open("#{@file}.txt", "r") do |f|
    puts f.read
  end
end

def moe_actions
  user_push_print_button("Moe")
  printer_request_to_server(@name)
  server_make_file(@info)
  server_send_file(@filename)
  printer_print_file
  user_get_file(@file)
end

def same_time_actions

  user_push_print_button("Moe")
  printer_request_to_server(@name)
  server_make_file(@info)

  user_push_print_button("Nishino")
  printer_request_to_server(@name)
  server_make_file(@info)

  server_send_file(@filename)
  printer_print_file
  user_get_file(@file)
  
  server_send_file(@filename)
  printer_print_file
  user_get_file(@file)  
end

moe_actions
# same_time_actions