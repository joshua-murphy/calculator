@unwelcome = false
@stored_data = []

def help_menu
  puts ""
  puts "=== Help Menu ==="
  puts "- Type 'exit' to exit the calculator -"
 #puts "- Type 'reset' to restart the calculator"  
 #puts "- Type 'something' to clear history"
  puts "- Type 'back' to reenter information -"
  puts "- Type 'history' to see past operations -"
  puts "- Allowed operations: '+ - * /' -"
end 

def math
  @num_one = @num_one.to_f.to_i
  @num_two = @num_two.to_f.to_i
  case @operator
    when "+"
      @solution_f = @num_one.to_f + @num_two.to_f
      @solution = @solution_f.to_i
      puts " "
      @store = "#{@num_one} + #{@num_two} = #{@solution}"
      puts @store
    when "-"
      @solution_f = @num_one.to_f - @num_two.to_f
      @solution = @solution_f.to_i
      puts " "
      @store = "#{@num_one} - #{@num_two} = #{@solution}"
      puts @store
    when "*"
      @solution_f = @num_one.to_f * @num_two.to_f
      @solution = @solution_f.to_i
      puts " "
      @store = "#{@num_one} * #{@num_two} = #{@solution}"
      puts @store
    when "/"
      @solution_f = @num_one.to_f / @num_two.to_f
      @solution = @solution_f.to_i
      @solution_f3 = @solution_f.round(3)
      if @solution == @solution_f
        puts " "
        @store = "#{@num_one} / #{@num_two} = #{@solution}"
        puts @store      
      else
        puts " "
        @store = "#{@num_one} / #{@num_two} = #{@solution_f3}"
        puts @store
      end
  end
  puts " " 
  puts "======================="    
  puts " "      

  save_data

  finalize
end

def history
  puts " "
  puts "=== History ==="
  puts @stored_data
  puts "= End History ="
end

def save_data
  @stored_data.push @store
  @stored_value = @stored_data.last
end

def finalize
  @num_one = ""
  @num_two = ""
end

def number_one
  puts " "
  if @num_one == ""
    puts "Enter first number:" 
  else
    puts "Renter first number:"    
  end  
  @num_one = gets.strip 
  if @num_one == "exit"
    exit(0)
  elsif @num_one == "back"
    @num_one = ""    
    puts "Nowhere to go!"
  elsif @num_one == "help"
    @num_one = ""    
    help_menu
  elsif @num_one == "history"
    @num_one = ""    
    history
  elsif @num_one == "0"
    operator_get
  elsif @num_one.to_i != 0
    operator_get
  else
    puts "Invalid Number"
    puts " "    
    number_one
  end
end

def operator_get
  puts " "
  if @operator == ""
    puts "Enter operator:" 
  else
    puts "Renter operator:"    
  end  
  @operator = gets.strip
    if @operator == "exit"
      exit(0)
    elsif @operator == "back"
      @operator = ""      
      number_one
    elsif @operator == "help"
      @operator = ""      
      help_menu
    elsif @operator == "history"
      @operator = ""      
      history
    end
    case @operator
      when @operator == "x", "-", "+", "*", "/"
        number_two
      when @operator == "help", "back", "history"
      else
        puts "Invalid Operator"
        operator_get
    end
end

def number_two
  puts " "
  puts "Enter second number:"        
  @num_two = gets.strip
  if @num_two == "exit"
    exit(0)
  elsif @num_two == "back"
    operator_get
  elsif @num_two == "history"
    history
  elsif @num_two == "0"
    math
  elsif @num_two.to_i != 0
    math
  else
    puts "Invalid Number"

    number_two
  end
end

def welcome
  if @unwelcome == false    
    puts " "    
    puts "=== Welcome to Calculator ==="
    puts "Type 'help' for more options"    
  else
    puts " "        
    puts "Type 'help' for more options"                  
  end
  @unwelcome = true
  
  number_one
end

while true
  @num_one = ""
  @operator = ""
  @num_two = ""  
  welcome

end