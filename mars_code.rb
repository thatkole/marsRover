

=begin
//declare the class called Rover
// the init statement will take the rover's init position, split it up into two ints and letter, assign to position and location.

// move method: take a string of letters, split into individual letters.
// loop over all letters. step, turn_left or right.
// split into two : step and turn.

// def step: move was the letter, for each direction, increment the right letter and print the effect.

// def status: prints a string with the points and heading.


//global main method. will 
=end


# Rover Class 
# Each will manage its own location and heading
# use of boundaries to stay within the plateau

class Rover 
  # boundaries of the plateau
  # self.X_BOUNDS #left boundary
  @@X_BOUNDS
  @@Y_BOUNDS #top most

  # self.Rovers = [

  def initialize(startPoint)

    #startPoint eg 3 1 N
    parts = startPoint.split(" ")

    @x_position = parts[0].to_i
    @y_position = parts[1].to_i
    @heading = parts[2]
  end

  # returns rover current position and direction
  def status
    puts "#{@x_position} #{@y_position} #{@heading}"
  end

  #push all the steps and determine which action to take eg MMMLLRM
  def move(allMoves)
    # puts allMoves
    0.upto(allMoves.length) do |i|
      if allMoves[i] == "M"
        step
      elsif allMoves[i] == "R"
        turnRight
      elsif allMoves[i] == "L"
        turnLeft
      end
    end

  end

  def turnRight
    if @heading == "N"
      @heading = "E"
    elsif @heading  == "E"
      @heading = "S"
    elsif @heading  == "S"
      @heading = "W"    
    else
      @heading = "N"
    end
  end

  def turnLeft
    if @heading == "N"
      @heading = "W"
    elsif @heading  == "W"
      @heading = "S"
    elsif @heading  == "S"
      @heading = "E"    
    else
      @heading = "N"
    end
  end

  #move in the right direction
  def step
    if @heading == "N"
      @y_position = @y_position <= Y_BOUNDS + 1 ? @y_position + 1 : @y_position
      # y_position += 1
      # puts @y_position <= Y_BOUNDS.to_i + 1
    elsif @heading  == "S"
      # y_position -= 1
      @y_position = @y_position > -1 ? @y_position - 1 : @y_position  
    elsif @heading  == "E"
      # x_position += 1
      @x_position = @x_position < X_BOUNDS + 1 ? @x_position + 1: @y_position 
    elsif @heading  == "W"
      @x_position = @x_position > -1 ?  @x_position - 1 : @x_position 
      # @y_position -= 1 #south 
    end
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
