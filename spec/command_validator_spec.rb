require 'spec_helper'

describe Robot::CommandValidator do

  describe '#validate_coords' do
    describe 'check for command PLACE' do
      describe 'if first param less than 0' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [-1, -1, 'NORTH'])
          expect(validator.valid?).to be false
        end
      end
      describe 'if second param more than 5' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [1, 6, 'NORTH'])
          expect(validator.valid?).to be false
        end
      end
      describe 'if first param more than -1 and less than 6' do
        it 'input data is valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 5, 'NORTH'])
          expect(validator.valid?).to be true
        end
      end
      describe 'if second param more than -1 and less than 6' do
        it 'input data is valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0, 'NORTH'])
          expect(validator.valid?).to be true
        end
      end
    end
  end

  describe '#validate_direction' do
    describe 'check for command PLACE' do
      describe 'if third param is not possible direction' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0, 'north'])
          expect(validator.valid?).to be false
        end
      end
      describe 'if third param is possible direction' do
        it 'input data is valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0, 'NORTH'])
          expect(validator.valid?).to be true
        end
      end
      describe 'if third param does not exist' do
        it 'input data is not valid' do
          validator = Robot::CommandValidator.new('PLACE', [5, 0])
          expect(validator.valid?).to be false
        end
      end
    end
  end

end
