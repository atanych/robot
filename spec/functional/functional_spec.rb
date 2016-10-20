require 'spec_helper'

describe Robot do
  let!(:manager) { Robot::Manager.new }

  describe 'test script a' do
    it 'returns output: 0,1,NORTH' do
      expect(manager.run_script('robot_scripts/a')).to eq('0,1,NORTH')
    end
  end

  describe 'test script b' do
    it 'returns output: 0,0,WEST' do
      expect(manager.run_script('robot_scripts/b')).to eq('0,0,WEST')
    end
  end

  describe 'test script c' do
    it 'returns output: 3,3,NORTH' do
      expect(manager.run_script('robot_scripts/c')).to eq('3,3,NORTH')
    end
  end

end
