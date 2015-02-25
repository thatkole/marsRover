#right hash

class Rover 

  @@X_BOUNDS
  @@Y_BOUNDS 

  def initialize(startPoint)

    @right_turn = {
      "N" => "E",
      "S" => "W", 
      "E" => "S", 
      "W" => "N"
    }

    @left_turn = {
      "N" => "W",
      "S" => "E", 
      "E" => "N", 
      "W" => "S"
    }

    @result = {
      "N" => [0, 1],
      "S" => [0, -1],
      "E" => [1, 0],
      "W" => [-1, 0]
    }

    #startPoint eg 3 1 N
    parts = startPoint.split(" ")

    @x_position = parts[0].to_i
    @y_position = parts[1].to_i
    @heading = parts[2]

  end


  def move(allMoves)

    # puts allMoves
    0.upto(allMoves.length) do |i|
      if allMoves[i] == "M"
         @x_position +=  @result[@heading][0]
         @y_position += @result[@heading][1]
      elsif allMoves[i] == "R"
        @heading = @right_turn[@heading]
      elsif allMoves[i] == "L"
        @heading = @left_turn[@heading]
      end
    end

  end

  # returns rover current position and direction
  def status
    puts "#{@x_position} #{@y_position} #{@heading}"
  end

end

world = "5 5"

WorldParts = world.split(" ")

X_BOUNDS = WorldParts[0].to_i
Y_BOUNDS = WorldParts[1].to_i

rover1 = Rover.new("1 2 N")
# puts rover1.status

rover1.move("LMLMLMLMM")
puts rover1.status

rover2 = Rover.new("3 3 E")
# puts rover2.status

rover2.move("MMRMMRMRRM")
puts rover2.status
