module Robot
  class Manager
    REPORT_COMMAND     = 'REPORT'
    INITIALIZE_COMMAND = 'PLACE'

    #
    # Read file script and run it
    #
    # @param [String] script_path - Path to script
    # @param [Boolean] skip_validation -  Ability to skip file validation
    #
    # @return [String] - Output data
    #
    def run_script(script_path, skip_validation = true)
      flush_output
      @robot = Robot::Engine.new
      # read input file line by line and immediately execute command
      File.open(script_path, 'r').each_line do |line|
        command, params = line.split(' ')
        params          = params.try(:split, ',')
        parser          = CommandValidator.new(command, params)
        if parser.valid?
          execute(command, params) if parser.command == INITIALIZE_COMMAND || @robot.inside_board?
        else
          return parser.errors.full_messages unless skip_validation
        end
      end
      @output
    end

    private
    #
    # Execute robot command
    #
    # @param [String] - Robot command
    # @param [Array] - Input params
    #
    def execute(command, params)
      if command == REPORT_COMMAND
        to_output(@robot.send(command.downcase, *params))
      else
        @robot.send(command.downcase, *params)
      end
    end

    #
    # Add row data to output
    #
    # @param [String] row
    #
    def to_output(row)
      @output = @output.present? ? "#{@output}\n#{row}" : row
    end

    #
    # Flush output data
    #
    def flush_output
      @output = ''
    end
  end
end