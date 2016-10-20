module Robot
  class CommandValidator
    include ActiveModel::Validations
    include ActiveModel::Conversion
    include ActiveModel::Model

    attr_accessor :command, :params

    validates :command, presence: true
    validates :command, inclusion: {in: Robot::Engine::COMMANDS}, allow_nil: true
    validate :validate_params

    def initialize(command, params)
      self.command = command
      self.params  = params
    end


    def validate_params
      if command == 'PLACE'
        if params.kind_of?(Array)
          errors[:params] << '[PLACE] Must be three params' unless params.size == 3
          validate_coords
          validate_direction
        else
          errors[:params] << '[PLACE] Not valid params'
        end
      end
    end

    def validate_coords
      (0..1).each do |index|
        if params.try(:[], index).try(:to_i) > 5 || params.try(:[], index).try(:to_i) < 0
          errors[:params] << "[PLACE] #{index+1} param should be more than -1 and less than 6"
        end
      end
    end

    def validate_direction
      direction = params.try(:[], 2)
      unless Robot::Engine::DIRECTIONS.include?(direction)
          errors[:params] << "[PLACE] Not valid 3 param. Expected #{Robot::Engine::DIRECTIONS.join(', ')}. Got #{direction}"
      end
    end
  end
end