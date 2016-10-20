require 'spec_helper'

describe Robot::Engine do
  let!(:engine) { Robot::Engine.new }

  describe '#place' do
    it 'validation rules were delegated to CommandParser' do

    end
  end

  describe '#move' do
    context 'when the robot direct to NORTH' do
      context 'and does not fall out' do
        it 'increments vertical position' do
          engine.place(1, 1, 'NORTH')
          engine.move
          expect(engine.y).to be(2)
        end
      end
      context 'and fall out' do
        it 'does not change vertical position' do
          engine.place(5, 5, 'NORTH')
          engine.move
          expect(engine.y).to be(5)
        end
      end
    end

    context 'when the robot direct to EAST' do
      context 'and does not fall out' do
        it 'increments horizontal position' do
          engine.place(1, 1, 'EAST')
          engine.move
          expect(engine.x).to be(2)
        end
      end
      context 'and fall out' do
        it 'does not change horizontal position' do
          engine.place(5, 5, 'EAST')
          engine.move
          expect(engine.y).to be(5)
        end
      end
    end

    context 'when the robot direct to SOUTH' do
      context 'and does not fall out' do
        it 'decrements vertical position' do
          engine.place(1, 1, 'SOUTH')
          engine.move
          expect(engine.y).to be(0)
        end
      end
      context 'and fall out' do
        it 'does not change vertical position' do
          engine.place(0, 0, 'SOUTH')
          engine.move
          expect(engine.y).to be(0)
        end
      end
    end

    context 'when the robot direct to WEST' do
      context 'and does not fall out' do
        it 'decrements horizontal position' do
          engine.place(1, 1, 'WEST')
          engine.move
          expect(engine.x).to be(0)
        end
      end
      context 'and fall out' do
        it 'does not change horizontal position' do
          engine.place(0, 0, 'WEST')
          engine.move
          expect(engine.x).to be(0)
        end
      end
    end
  end

  describe '#left' do
    context 'when the robot directed to WEST' do
      it 'rotates to SOUTH' do
        engine.place(1, 1, 'WEST')
        engine.left
        expect(engine.face).to eq('SOUTH')
      end
    end
    context 'when the robot directed to NORTH' do
      it 'rotates to WEST' do
        engine.place(1, 1, 'NORTH')
        engine.left
        expect(engine.face).to eq('WEST')
      end
    end
  end

  describe '#right' do
    context 'when the robot directed to WEST' do
      it 'rotates to NORTH' do
        engine.place(1, 1, 'WEST')
        engine.right
        expect(engine.face).to eq('NORTH')
      end
    end
    context 'when the robot directed to NORTH' do
      it 'rotates to EAST' do
        engine.place(1, 1, 'NORTH')
        engine.right
        expect(engine.face).to eq('EAST')
      end
    end
  end

  describe '#report' do
    context 'when the robot has state: x=1, y=2, face=NORTH' do
      it 'returns 1,2,NORTH' do
        engine.place(1, 2, 'NORTH')
        expect(engine.report).to eq('1,2,NORTH')
      end
    end
    context 'when the robot has state: x=5, y=5, face=WEST' do
      it 'returns 5,5,WEST' do
        engine.place(5, 5, 'WEST')
        expect(engine.report).to eq('5,5,WEST')
      end
    end
  end

end
