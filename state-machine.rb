class RomanTranslator

  def decode(roman_number)
    init_state_machine
    state_machine(roman_number)
    print_result
  end

  private

  STATE = {
    idle: 0,
    one: 1,
    two: 2,
    three: 3,
    five: 5,
    ten: 10,
    twenty: 20,
    thirty: 30,
    fifty: 50,
    stop: -1,
    error: -2
  }

  current_state = STATE[:idle]
  value = 0

  def init_state_machine
    @current_state = STATE[:idle]
    @value = 0
  end

  def state_machine(roman_number)
    chars = roman_number.split("").reverse.push("O")
    chars.each do |char|
      execute_state_machine(char)
      break if @current_state == STATE[:error]
    end
  end

  def print_result
    if @current_state == STATE[:stop]
      puts "#{@value}"
    else
      puts "Invalid Roman number"
    end
  end

  def execute_state_machine(char)
    case @current_state
    when STATE[:idle] then execute_state_idle(char)
    when STATE[:one] then execute_state_one(char)
    when STATE[:two] then execute_state_two(char)
    when STATE[:three] then execute_state_three(char)
    when STATE[:five] then execute_state_five(char)
    when STATE[:ten] then execute_state_ten(char)
    when STATE[:twenty] then execute_state_twenty(char)
    when STATE[:thirty] then execute_state_thirty(char)
    when STATE[:fifty] then execute_state_fifty(char)
    end
  end

	def execute_state_idle(char)
		case char
		when "I"
      @current_state = STATE[:one]
		when "V"
      @current_state = STATE[:five]
		when "X"
      @current_state = STATE[:ten]
		when "L"
      @current_state = STATE[:fifty]
		when "O"
      @current_state = STATE[:stop]
		end
	end

	def execute_state_one(char)
		case char
		when "I"
      @current_state = STATE[:two]
		when "V"
      @current_state = STATE[:five]
      @value += 1
		when "X"
      @current_state = STATE[:ten]
      @value += 1
		when "L"
      @current_state = STATE[:fifty]
      @value += 1
		when "O"
      @current_state = STATE[:stop]
      @value += 1
		end
	end

	def execute_state_two(char)
		case char
		when "I"
      @current_state = STATE[:three]
		when "V"
      @current_state = STATE[:five]
      @value += 2
		when "X"
      @current_state = STATE[:ten]
      @value += 2
		when "L"
      @current_state = STATE[:fifty]
      @value += 2
		when "O"
      @current_state = STATE[:stop]
      @value += 2
		end
	end

	def execute_state_three(char)
		case char
		when "I"
      @current_state = STATE[:error]
		when "V"
      @current_state = STATE[:five]
      @value += 3
		when "X"
      @current_state = STATE[:ten]
      @value += 3
		when "L"
      @current_state = STATE[:fifty]
      @value += 3
		when "O"
      @current_state = STATE[:stop]
      @value += 3
		end
	end

	def execute_state_five(char)
		case char
		when "I"
      @current_state = STATE[:idle]
      @value += 4
		when "V"
      @current_state = STATE[:error]
		when "X"
      @current_state = STATE[:ten]
      @value += 5
		when "L"
      @current_state = STATE[:fifty]
      @value += 5
		when "O"
      @current_state = STATE[:stop]
      @value += 5
		end
	end

	def execute_state_ten(char)
		case char
		when "I"
      @current_state = STATE[:idle]
      @value += 9
		when "V"
      @current_state = STATE[:error]
		when "X"
      @current_state = STATE[:twenty]
		when "L"
      @current_state = STATE[:fifty]
      @value += 10
		when "O"
      @current_state = STATE[:stop]
      @value += 10
		end
	end

	def execute_state_twenty(char)
		case char
		when "I"
      @current_state = STATE[:error]
		when "V"
      @current_state = STATE[:error]
		when "X"
      @current_state = STATE[:thirty]
		when "L"
      @current_state = STATE[:fifty]
      @value += 20
		when "O"
      @current_state = STATE[:stop]
      @value += 20
		end
	end

	def execute_state_thirty(char)
		case char
		when "I"
      @current_state = STATE[:error]
		when "V"
      @current_state = STATE[:error]
		when "X"
      @current_state = STATE[:error]
		when "L"
      @current_state = STATE[:fifty]
      @value += 30
		when "O"
      @current_state = STATE[:stop]
      @value += 30
		end
	end

	def execute_state_fifty(char)
		case char
		when "I"
      @current_state = STATE[:error]
		when "V"
      @current_state = STATE[:error]
		when "X"
      @current_state = STATE[:idle]
      @value += 40
		when "L"
      @current_state = STATE[:error]
		when "O"
      @current_state = STATE[:stop]
      @value += 50
		end
	end
end
