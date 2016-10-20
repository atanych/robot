module Robot
  class Engine
    attr_reader :x, :y, :face
    DIRECTIONS = %w(NORTH EAST SOUTH WEST).freeze
    COMMANDS = %w(PLACE MOVE LEFT RIGHT REPORT).freeze
    STATUSES = %w(OUTSIDE INSIDE).freeze

    def initialize
      outside_board!
    end

    #
    # Put the robot on the table in position X,Y and facing NORTH, SOUTH, EAST or WEST
    # @param [String] x
    # @param [String] y
    # @param [String] f
    #
    def place(x, y, f)
      inside_board!
      @x = x.to_i
      @y = y.to_i
      @face = f
    end

    #
    # Move the robot to new position
    # Any move that would cause the robot to fall must be ignored.
    #
    def move
      case
        when @face == 'NORTH'
          @y += 1 if @y < 5
        when @face == 'EAST'
          @x += 1 if @x < 5
        when @face == 'SOUTH'
          @y -= 1 if @y > 0
        when @face == 'WEST'
          @x -= 1 if @x > 0
        else
          raise 'Not correct direction'
      end
    end

    #
    # Rotate the robot 90 degrees in the left direction
    #
    def left
      @face = DIRECTIONS[(DIRECTIONS.index(@face) - 1) % DIRECTIONS.size]
    end

    #
    # Rotate the robot 90 degrees in the right direction
    #
    def right
      @face = DIRECTIONS[(DIRECTIONS.index(@face) + 1) % DIRECTIONS.size]
    end

    #
    # Return current state of the robot
    #
    # @return [String]
    #
    def report
      "#{@x},#{@y},#{@face}" if inside_board?
    end

    #####################################
    # Simple enums implementation (rails)
    #####################################

    def inside_board!
      @status = 'INSIDE'
    end

    def inside_board?
      @status == 'INSIDE'
    end

    def outside_board?
      @status == 'OUTSIDE'
    end

    def outside_board!
      @status = 'OUTSIDE'
    end
  end
end
