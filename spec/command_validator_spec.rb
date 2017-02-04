require 'spec_helper'

describe Robot::CommandValidator do

  context '#validate_coords' do
    context 'check for command PLACE' do
      context 'if first param less than 0' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [-1, -1, 'NORTH'])
          expect(validator.valid?).to be false
        end
      end
      context 'if second param more than 5' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [1, 6, 'NORTH'])
          expect(validator.valid?).to be false
        end
      end
      context 'if first param more than -1 and less than 6' do
        it 'input data is valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 5, 'NORTH'])
          expect(validator.valid?).to be true
        end
      end
      context 'if second param more than -1 and less than 6' do
        it 'input data is valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0, 'NORTH'])
          expect(validator.valid?).to be true
        end
      end
    end
  end

  context '#validate_direction' do
    context 'check for command PLACE' do
      context 'if third param is not possible direction' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0, 'north'])
          expect(validator.valid?).to be false
        end
      end
      context 'if third param is possible direction' do
        it 'input data is valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0, 'NORTH'])
          expect(validator.valid?).to be true
        end
      end
      context 'if third param does not exist' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0])
          expect(validator.valid?).to be false
        end
      end
    end
  end

end
