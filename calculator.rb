@stored_data = []

def help_menu
  puts "\n=== Help Menu ==="
  puts "- Type 'exit' to exit the calculator"
  puts "- Type 'back' to re-enter information"
  puts "- Type 'history' to see past operations"
  puts "- Type 'erase' to clear history"
  puts "- Allowed operations: '+ - * /'"
end

def calculate(num_one, operator, num_two)
  if operator == "/" && num_two == 0
    puts "\nNice try"
  else
    s = ( num_one.to_f.send( operator.to_sym, num_two.to_f ).round(3) )
    solution = s.to_f == s.to_i ? s.to_i : s
    store = "#{num_one} #{operator} #{num_two} = #{solution}"
    puts "\n" + store
    puts "\n==============\n "
    @stored_data.push(store)
    welcome
  end
end

def number_one
  print "\nEnter first number: "
  case input = gets.strip.downcase
    when "exit"
      exit(0)
    when "help"
      help_menu
    when "history"
      puts "\n=== History ===\n   #{@stored_data.join("\n   ")} \n= End of History ="
    when "erase"
      @stored_data = []
      print "\nCleared history"
    when "0"
      operator_get(0)
    else
      case input.to_i
        when 0
          puts "Invalid input"
          number_one
        else
          num = input.to_f == input.to_i ? input.to_i : input.to_f
          operator_get(num)
      end
  end
  number_one
end

def operator_get(num_one)
  print "Enter operator: "
  case input = gets.strip.downcase
    when "exit"
      exit(0)
    when "back"
      number_one
    when "+", "-", "*", "/"
      number_two(num_one, input)
    else
      puts "Invalid input"
      operator_get(num_one)
  end
end

def number_two(num_one, operator)
  print "Enter second number: "
  case input = gets.strip.downcase
    when "exit"
      exit(0)
    when "back"
      operator_get(num_one)
    when "0" 
      calculate(num_one, operator, 0)      
    else
      case input.to_i
        when 0
          puts "Invalid input"
          num_two(num_one, operator)
        else
          num = input.to_f == input.to_i ? input.to_i : input.to_f          
          calculate(num_one, operator, num)
      end
  end
end

def welcome
  puts "Type 'help' for more options"
  number_one
end

puts "\n\n=== Welcome to Ruby Calculator ==="
welcome